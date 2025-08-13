*** Settings ***
Resource    ../../resources/common/common_settings.robot

Library    ../../library-python/CaptureAPI.py    WITH NAME     bikip

*** Keywords ***
Close PandaPay
    Close All Browsers

*** Keywords ***
Basic Setup
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${logging_prefs}=    Create Dictionary    performance=ALL
    Call Method    ${options}    set_capability    goog:loggingPrefs    ${logging_prefs}
    Open Browser    ${DEV_URL}    ${BROWSER}    options=${options}
    Maximize Browser Window
    Wait Until Page Contains Element    ${USERID_FIELD}
    Wait Until Page Contains Element    ${PASSWORD_FIELD}

Wait for API Request
    [Arguments]    ${driver}    ${api_endpoint}    ${http-method}    ${timeout}
    bikip.Clear Persistent Storage    ${driver}
    ${request}=    bikip.Wait For Request    ${driver}    ${api_endpoint}    ${http-method}    ${timeout}
    [RETURN]    ${request}

Log everything of API Request
    [Arguments]    ${request}
    Log    URL: ${request['url']}
    Log    Method: ${request['method']}
    Log    StatusCode: ${request['status']}
    Log    Payload: ${request['payload']}
    Log    Response: ${request['response']}

Parse JSON String
    [Arguments]    ${string}
    ${json}=    Evaluate    json.loads('''${string}''')    $json
    [RETURN]    ${json}
