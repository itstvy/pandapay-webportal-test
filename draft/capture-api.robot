*** Settings ***
Resource    ../resources/common/common_settings.robot
Suite Setup    Basic Setup
Suite Teardown  Close PandaPay

*** Test Cases ***
Verify the Admin sign in successfully when input correct account
    ${driver}=    Get Library Instance    SeleniumLibrary
    bikip.Clear Persistent Storage    ${driver.driver}
    bikip.Start Network Interception    ${driver.driver}
    bikip.Clear Intercepted Requests    ${driver.driver}

    Given user is on the sign in page
    When user enters Admin User ID
    And user enters Admin password
    And user tick on the Admin checkbox
    And user clicks Sign In button
    
    #Capture API
    ${signin_request}=    Wait for API Request    ${driver.driver}    ${SIGNIN_ENDPOINT}    POST    10
    #Log
    Log everything of API Request    ${signin_request}
    
    #Parse payload
    ${signin_payload}=    Set Variable    ${signin_request['payload']}
    ${parse_signin_payload}=    Evaluate    json.loads('''${signin_payload}''')
    Should Be Equal    ${parse_signin_payload['type']}    ${TYPE_MASTER_ADMIN}

    #Parse response
    ${signin_response}=    Set Variable    ${signin_request['response']}
    ${parse_signin_response}=    Evaluate    json.loads('''${signin_response}''')    json   

    #Get info in Sign In response to verify User code value
    ${data_of_signin}=    Set Variable    ${parse_signin_response['data']}
    ${info_of_signin}=    Set Variable    ${data_of_signin['info']}
    Log    ${info_of_signin['user_code']}  
    Should Be Equal    ${info_of_signin['user_code']}    ${ADMIN}

    #Set message
    Set Test Message    URL: ${signin_request['url']}
    Set Test Message    \n\nStatusCode: ${signin_request['status']}    append=True
    Set Test Message    \n\nPayload: ${signin_request['payload']}    append=True
    Set Test Message    \n\nResponse: ${signin_request['response']}    append=True

    bikip.Stop Network Interception    ${driver.driver}





    
