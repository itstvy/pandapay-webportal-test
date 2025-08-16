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
Get Selenium Driver
    [Arguments]    ${library_name}=SeleniumLibrary

    ${selenium_Library}=    Get Library Instance    ${library_name}
    ${webdriver}=    Set Variable    ${selenium_Library.driver}
    [RETURN]    ${webdriver}

Wait for API Request
    [Arguments]    ${driver}    ${api_endpoint}    ${http-method}    ${timeout}

    bikip.Clear Persistent Storage    ${driver}
    ${request}=    bikip.Wait For Request    ${driver}    ${api_endpoint}    ${http-method}    ${timeout}
    [RETURN]    ${request}

#Setup API Capture Environment
Clear API Storage
    [Arguments]    ${driver}
    bikip.Clear Persistent Storage    ${driver}

Start API Capture
    [Arguments]    ${driver}
    bikip.Start Network Interception    ${driver}

Clear API Intercepted Requests
    [Arguments]    ${driver}
    bikip.Clear Intercepted Requests    ${driver}

#This is the keyword use for 3 steps above
Setup API Capture Environment
    [Arguments]    ${driver}
    Clear API Storage    ${driver}
    Start API Capture    ${driver}
    Clear API Intercepted Requests    ${driver}


Log everything of API Request
    [Arguments]    ${request}

    Log    URL: ${request['url']}
    Log    Method: ${request['method']}
    Log    StatusCode: ${request['status']}
    Log    Payload: ${request['payload']}
    Log    Response: ${request['response']}
