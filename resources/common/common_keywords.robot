*** Settings ***
Resource    ../../resources/common/common_settings.robot
Resource    ../../resources/common/common_variables.robot
Resource    ../../resources/keywords/authentication/sign-in-keywords.robot

*** Keywords ***

Close PandaPay
    Close All Browsers

*** Keywords ***
Basic Setup
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${logging_prefs}=    Create Dictionary    performance=ALL
    Call Method    ${options}    set_capability    goog:loggingPrefs    ${logging_prefs}
    Open Browser    ${DEV_URL}    ${BROWSER}    options=${options}

# Open Browser With Network Logging
#       [Arguments]    ${url}    ${browser}=chrome
#       ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
#       ${logging_prefs}=    Create Dictionary    performance=ALL
#       Call Method    ${options}    set_capability    goog:loggingPrefs    ${logging_prefs}
#       Open Browser    ${url}    ${browser}    options=${options}
#       Maximize Browser Window

# Prepare For Request Interception
#     [Arguments]    ${endpoint}
#     ${driver}=    Get Library Instance    SeleniumLibrary
#     bikipluyenrong.Inject Request Interceptor    ${driver.driver}    ${endpoint}
#     RETURN    ${driver}

# Get Request API
#     [Arguments]    ${driver}
#     ${requests}=    bikipluyenrong.Get Intercepted Requests    ${driver.driver}
#     ${status}=    Set Variable    ${requests[0]['status']}
#     ${url}=       Set Variable    ${requests[0]['url']}
#     ${payload}=   Set Variable    ${requests[0]['payload']}
#     ${body}=      Set Variable    ${requests[0]['response']}
#     &{result}=    Create Dictionary    status=${status}    body=${body}     payload=${payload}      url=${url}
#     RETURN    ${result}

# Parse Response API
#     [Arguments]    ${body}
#     ${response_json}=    Evaluate    json.loads('''${body}''')    json
#     ${success}=          Set Variable    ${response_json['success']}
#     ${statusCode}=       Set Variable    ${response_json['statusCode']}
#     ${message}=          Set Variable    ${response_json['message']}
#     ${data}=             Set Variable    ${response_json['data']}
#     &{parsed}=           Create Dictionary    success=${success}    statusCode=${statusCode}  message=${message}    data=${data}
#     RETURN    &{parsed}