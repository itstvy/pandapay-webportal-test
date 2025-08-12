from robot.api.deco import keyword
from selenium.webdriver.support.events import AbstractEventListener
import time
import json
import threading
import logging
from typing import Optional, Dict, List, Any, Union
from dataclasses import dataclass
import os
import pickle
from datetime import datetime

@dataclass
class RequestInfo:
    """Data class to store request information"""
    url: str
    method: str
    headers: Dict[str, str]
    payload: Optional[str]
    status: Optional[int]
    response: Optional[str]
    timestamp: float
    request_id: Optional[str] = None
    error: Optional[str] = None
    page_url: Optional[str] = None
    session_id: Optional[str] = None

class NetworkError(Exception):
    """Base exception for network-related errors"""
    pass

class RequestTimeoutError(NetworkError):
    """Exception raised when request times out"""
    pass

class ResponseParsingError(NetworkError):
    """Exception raised when response parsing fails"""
    pass

class CaptureAPI(AbstractEventListener):
    """
    Enhanced network monitoring and interception class
    - Sửa hàm cũ để hoạt động tốt hơn
    - Giữ hàm mới đã hoạt động
    - THÊM persistent storage để giải quyết vấn đề reload
    """
    
    def __init__(self, persistent_storage=True, storage_file=None):
        """Initialize the network interceptor"""
        self.driver = None
        self._request_map = {}
        self._is_listening = False
        self._setup_logging()
        self._js_intercepted_requests = []
        self._monitor_thread: Optional[threading.Thread] = None
        
        # THÊM: Persistent storage để không bị mất khi reload
        self._persistent_storage = persistent_storage
        self._storage_file = storage_file or os.path.join(os.getcwd(), "logs", "network_requests_v2.pkl")
        self._session_id = datetime.now().strftime("%Y%m%d_%H%M%S")
        self._all_requests = []  # Store all requests across sessions
        
        # THÊM: Bộ nhớ tạm cho phiên làm việc hiện tại
        self._captured_requests: List[Dict[str, Any]] = []
        self._request_details: Dict[str, Dict[str, Any]] = {}  # requestId -> details
        
        # Load existing requests if persistent storage is enabled
        if self._persistent_storage:
            self._load_requests()

    def _setup_logging(self) -> None:
        """Setup logging configuration"""
        logging.basicConfig(
            level=logging.INFO,
            format='%(asctime)s - %(levelname)s - %(message)s'
        )
        self.logger = logging.getLogger('CaptureAPI')

    def _get_webdriver(self, driver) -> Any:
        """Get the actual WebDriver instance from SeleniumLibrary"""
        if hasattr(driver, 'driver'):
            return driver.driver
        return driver

    # ==================== THÊM: Persistent Storage Functions ====================

    def _save_requests(self) -> None:
        """Save requests to persistent storage"""
        if self._persistent_storage:
            try:
                with open(self._storage_file, 'wb') as f:
                    pickle.dump(self._all_requests, f)
                self.logger.info(f"Saved {len(self._all_requests)} requests to {self._storage_file}")
            except Exception as e:
                self.logger.error(f"Error saving requests: {str(e)}")

    def _load_requests(self) -> None:
        """Load requests from persistent storage"""
        if self._persistent_storage and os.path.exists(self._storage_file):
            try:
                with open(self._storage_file, 'rb') as f:
                    self._all_requests = pickle.load(f)
                self.logger.info(f"Loaded {len(self._all_requests)} requests from {self._storage_file}")
            except Exception as e:
                self.logger.error(f"Error loading requests: {str(e)}")
                self._all_requests = []

    def _add_request_to_storage(self, request_info: Dict[str, Any]) -> None:
        """Add request to persistent storage"""
        # Add metadata
        request_info['session_id'] = self._session_id
        request_info['page_url'] = self.driver.current_url if self.driver else None
        request_info['capture_timestamp'] = datetime.now().isoformat()
        
        # Lưu vào bộ nhớ tạm của phiên và kho bền vững
        self._captured_requests.append(request_info)
        self._all_requests.append(request_info)
        
        # Save periodically (every 5 requests for faster saving)
        if len(self._all_requests) % 5 == 0:
            self._save_requests()

    # ==================== JS Hook Injection ====================
    def _inject_request_hooks(self) -> None:
        """Inject hooks for fetch and XHR to persist requests across reloads."""
        js_source = """
        (function(){
          try {
            const KEY = '_sessionRequests';
            const push = (rec) => {
              try {
                const arr = JSON.parse(sessionStorage.getItem(KEY) || '[]');
                arr.push(rec);
                sessionStorage.setItem(KEY, JSON.stringify(arr));
              } catch (e) { /* ignore */ }
            };
            // Skip if already hooked
            if (!window.__rf_net_hooked__) {
              // Hook fetch
              const origFetch = window.fetch;
              window.fetch = async function(input, init){
                const url = (typeof input === 'string') ? input : (input && input.url) || '';
                const method = (init && init.method) ? init.method : 'GET';
                const payload = (init && init.body) ? (typeof init.body === 'string' ? init.body : (new TextDecoder('utf-8')).decode(init.body)) : null;
                try {
                  const res = await origFetch.apply(this, arguments);
                  res.clone().text().then(function(bodyText){
                    push({ url, method, payload, status: res.status, response: bodyText, timestamp: Date.now() });
                  });
                  return res;
                } catch (e) {
                  push({ url, method, payload, status: null, response: null, error: String(e), timestamp: Date.now() });
                  throw e;
                }
              };
              // Hook XHR
              const origOpen = XMLHttpRequest.prototype.open;
              const origSend = XMLHttpRequest.prototype.send;
              XMLHttpRequest.prototype.open = function(method, url){ this.__rf_method = method; this.__rf_url = url; return origOpen.apply(this, arguments); };
              XMLHttpRequest.prototype.send = function(body){
                const that = this;
                const payload = body ? (typeof body === 'string' ? body : '') : null;
                this.addEventListener('load', function(){
                  try {
                    push({ url: that.__rf_url || '', method: that.__rf_method || '', payload, status: that.status, response: that.responseText, timestamp: Date.now() });
                  } catch (e) { /* ignore */ }
                });
                return origSend.apply(this, arguments);
              };
              window.__rf_net_hooked__ = true;
            }
          } catch (e) { /* ignore */ }
        })();
        """
        try:
            # Inject for current document
            self.driver.execute_script(js_source)
            # Ensure on new documents as well
            self.driver.execute_cdp_cmd('Page.addScriptToEvaluateOnNewDocument', { 'source': js_source })
        except Exception as e:
            self.logger.warning(f"Failed to inject hooks: {str(e)}")

    def _collect_js_requests(self) -> List[Dict[str, Any]]:
        """Collect and drain requests persisted in sessionStorage by JS hooks."""
        try:
            js_requests = self.driver.execute_script(
                """
                try {
                  const KEY = '_sessionRequests';
                  const arr = JSON.parse(sessionStorage.getItem(KEY) || '[]');
                  sessionStorage.removeItem(KEY);
                  return arr;
                } catch (e) { return []; }
                """
            )
            return js_requests or []
        except Exception:
            return []

    # ==================== Performance Log Processing ====================
    def _process_performance_logs(self) -> None:
        """Read Chrome performance logs, map request lifecycle, and capture payload/response."""
        try:
            logs = self.driver.get_log('performance')
        except Exception:
            logs = []
        for entry in logs:
            try:
                message = json.loads(entry['message'])['message']
                method_name = message.get('method')
                params = message.get('params', {})
                if method_name == 'Network.requestWillBeSent':
                    request = params.get('request', {})
                    request_id = params.get('requestId')
                    url = request.get('url', '')
                    method = request.get('method', '')
                    post_data = request.get('postData')
                    self._request_details.setdefault(request_id, {}).update({
                        'url': url,
                        'method': method,
                        'payload': post_data,
                        'timestamp': time.time(),
                    })
                elif method_name == 'Network.responseReceived':
                    response = params.get('response', {})
                    request_id = params.get('requestId')
                    status = response.get('status')
                    headers = response.get('headers', {})
                    self._request_details.setdefault(request_id, {}).update({
                        'status': status,
                        'headers': headers,
                        'timestamp': time.time(),
                    })
                elif method_name == 'Network.loadingFinished':
                    request_id = params.get('requestId')
                    # Attempt to get body
                    body_text = ''
                    try:
                        body = self.driver.execute_cdp_cmd('Network.getResponseBody', {'requestId': request_id})
                        body_text = body.get('body', '')
                    except Exception:
                        pass
                    details = self._request_details.get(request_id, {})
                    if details and details.get('url'):
                        request_info = {
                            'url': details.get('url'),
                            'method': details.get('method'),
                            'headers': details.get('headers', {}),
                            'payload': details.get('payload'),
                            'status': details.get('status'),
                            'response': body_text,
                            'timestamp': details.get('timestamp', time.time())
                        }
                        # Store only once per requestId
                        if not details.get('__stored__'):
                            self._add_request_to_storage(request_info)
                            details['__stored__'] = True
            except Exception:
                continue

    def _match_requests(self, source: List[Dict[str, Any]], endpoint: str, method: Optional[str]) -> Optional[Dict[str, Any]]:
        for req in source:
            url = req.get('url', '')
            if endpoint in url:
                if not method or req.get('method', '').upper() == method.upper():
                    # Ensure response or at least status is present
                    if req.get('response') is not None or req.get('status') is not None:
                        return req
        return None

    # ==================== Public Keywords ====================
    @keyword("Start Network Interception")
    def start_network_interception(self, driver: Any) -> None:
        """Enable network and performance logging, inject JS hooks, and clear buffers."""
        self.driver = self._get_webdriver(driver)
        try:
            self.driver.execute_cdp_cmd('Network.enable', {})
            self.driver.execute_cdp_cmd('Performance.enable', {})
        except Exception as e:
            self.logger.warning(f"Unable to enable CDP domains: {str(e)}")
        # Drain old logs
        try:
            self.driver.get_log('performance')
        except Exception:
            pass
        self._captured_requests.clear()
        self._request_details.clear()
        self._is_listening = True
        # Inject hooks for current and subsequent documents
        self._inject_request_hooks()

    @keyword("Stop Network Interception")
    def stop_network_interception(self, driver: Any) -> None:
        """Stop listening (does not clear persisted data)."""
        self.driver = self._get_webdriver(driver)
        self._is_listening = False

    @keyword("Clear Intercepted Requests")
    def clear_intercepted_requests(self, driver: Any) -> None:
        """Clear in-memory buffers and sessionStorage hooks buffer."""
        self.driver = self._get_webdriver(driver)
        self._captured_requests.clear()
        self._request_details.clear()
        try:
            self.driver.execute_script("sessionStorage.removeItem('_sessionRequests');")
        except Exception:
            pass

    @keyword("Get Intercepted Requests")
    def get_intercepted_requests(self, driver: Any) -> List[Dict[str, Any]]:
        """Return all captured requests so far (current session memory)."""
        self.driver = self._get_webdriver(driver)
        # Process any pending logs and JS buffer before returning
        self._process_performance_logs()
        js_reqs = self._collect_js_requests()
        for req in js_reqs:
            self._add_request_to_storage(req)
        return list(self._captured_requests)

    @keyword("Wait For Request")
    def wait_for_request(self, driver: Any, endpoint: str, method: str = None, timeout: int = 10) -> Dict[str, Any]:
        """Wait until a request matching endpoint (substring) and optional method appears.
        Returns request dict with url, method, headers, payload, status, response, timestamp.
        """
        self.driver = self._get_webdriver(driver)
        end_time = time.time() + timeout
        last_error = None
        while time.time() < end_time:
            try:
                # 1) Process performance logs into captured requests
                self._process_performance_logs()
                # 2) Drain JS-persisted requests
                js_reqs = self._collect_js_requests()
                for req in js_reqs:
                    self._add_request_to_storage(req)
                # 3) Try to match in-memory captured first
                match = self._match_requests(self._captured_requests[::-1], endpoint, method)
                if match:
                    return match
                # 4) Try persistent store as a fallback
                match = self._match_requests(self._all_requests[::-1], endpoint, method)
                if match:
                    return match
            except Exception as e:
                last_error = e
            time.sleep(0.05)
        if last_error:
            raise RequestTimeoutError(f"Request not captured for endpoint '{endpoint}' within {timeout}s; last error: {last_error}")
        raise RequestTimeoutError(f"Request not captured for endpoint '{endpoint}' within {timeout}s")

    @keyword("Capture API Request After Click")
    def capture_api_request_after_click(self, driver: Any, endpoint: str, method: str = "POST", timeout: int = 10):
        """
        Capture API request SAU KHI đã click button
        Giải quyết vấn đề: click → API call → reload → mất request
        SỬ DỤNG: Persistent storage để không bị mất
        """
        try:
            self.driver = self._get_webdriver(driver)
            
            # Enable performance logging ngay lập tức
            try:
                self.driver.execute_cdp_cmd('Network.enable', {})
                self.driver.execute_cdp_cmd('Performance.enable', {})
            except Exception as e:
                self.logger.warning(f"Unable to enable CDP domains: {str(e)}")

            # Inject hooks to persist across reloads
            self._inject_request_hooks()
            
            # Clear existing logs
            try:
                self.driver.get_log('performance')
            except Exception:
                pass
            time.sleep(0.05)
            
            # Monitor performance logs with high frequency
            start_time = time.time()
            while time.time() - start_time < timeout:
                # 1) Check persistent storage first
                for request in self._all_requests[::-1]:
                    if (endpoint in request.get('url', '') and 
                        (not method or request.get('method', '').upper() == method.upper()) and
                        (request.get('status') is not None or request.get('response') is not None)):
                        self.logger.info(f"Found request in persistent storage: {request['url']}")
                        return request
                
                # 2) Drain JS hook buffer
                js_requests = self._collect_js_requests()
                if js_requests:
                    for request in js_requests:
                        if (endpoint in request.get('url', '') and 
                            (not method or request.get('method', '').upper() == method.upper())):
                            self._add_request_to_storage(request)
                            return request
                        else:
                            # Still store for later retrieval
                            self._add_request_to_storage(request)
                
                # 3) Process performance logs and build requests
                self._process_performance_logs()
                match = self._match_requests(self._captured_requests[::-1], endpoint, method)
                if match:
                    return match
                
                # High frequency monitoring - 50ms
                time.sleep(0.05)
            
            raise RequestTimeoutError(f"Request not captured within {timeout} seconds")
            
        except Exception as e:
            self.logger.error(f"Capture after click failed: {str(e)}")
            raise NetworkError(f"Capture after click failed: {str(e)}")

    