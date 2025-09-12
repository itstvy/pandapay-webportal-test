*** Settings ***
Resource    ../../../resources/common/common_settings.robot

*** Keywords ***
# Basic Navigation Keywords
user is on the sign in page
    Wait Until Page Contains Element    ${USERID_FIELD}
    Wait Until Page Contains Element    ${PASSWORD_FIELD}

# Input Field Interaction Keywords
user clicks on User ID field
    Wait Until Page Contains Element    ${USERID_FIELD}
    Click Element    ${USERID_FIELD}

user clicks on Password field
    Wait Until Page Contains Element    ${PASSWORD_FIELD}
    Click Element    ${PASSWORD_FIELD}

user ticks the Admin checkbox
    Wait Until Page Contains Element    ${ADMIN_CHECKBOX_UNCHECKED}
    Click Element    ${ADMIN_CHECKBOX_UNCHECKED}
user unticks the Admin checkbox
    Wait Until Page Contains Element    ${ADMIN_CHECKBOX_CHECKED}
    Click Element    ${ADMIN_CHECKBOX_CHECKED}

user clicks Sign In button
    Click Element    ${SIGNIN_BUTTON}

# User ID Input Keywords
user enters Owner User ID
    Input Text    ${USERID_FIELD}    ${OWNER_USER_ID}

user enters Admin User ID
    Input Text    ${USERID_FIELD}    ${ADMIN}

user enters Deactivated User ID
    Input Text    ${USERID_FIELD}    ${DEACTIVATED_USER_ID}

user enters Deactivated Password
    Input Text    ${PASSWORD_FIELD}    ${DEACTIVATED_PASSWORD}

user leaves User ID empty
    Input Text    ${USERID_FIELD}    ${EMPTY}

user enters User ID with less than 5 characters
    Input Text    ${USERID_FIELD}    ${USER_ID_LESS_THAN_5}

user enters User ID with more than 20 characters
    Input Text    ${USERID_FIELD}    ${USER_ID_MORE_THAN_20}

user enters User ID with special characters
    Input Text    ${USERID_FIELD}    ${USER_ID_CONTAIN_SPECIAL_CHARACTERS}

user enters User ID with spaces
    Input Text    ${USERID_FIELD}    ${USER_ID_CONTAIN_SPACES}

# Password Input Keywords
user enters Owner password
    Input Text    ${PASSWORD_FIELD}    ${OWNER_PASSWORD}

user enters incorrect Owner Password
    Input Text    ${PASSWORD_FIELD}    ${INCORRECT_PASSWORD}

user enters Admin password
    Input Text    ${PASSWORD_FIELD}    ${ADMIN_PASSWORD}

user leaves Password empty
    Input Text    ${PASSWORD_FIELD}    ${EMPTY}

user enters Password with less than 8 characters
    Input Text    ${PASSWORD_FIELD}    ${PASSWORD_LESS_THAN_8}

user enters Password with spaces
    Input Text    ${PASSWORD_FIELD}    ${PASSWORD_CONTAIN_SPACES}

user enters Password without numbers
    Input Text    ${PASSWORD_FIELD}    ${PASSWORD_MISSING_NUMBER}

user enters Password without uppercase letters
    Input Text    ${PASSWORD_FIELD}    ${PASSWORD_MISSING_UPPERCASE}

user enters Password without lowercase letters
    Input Text    ${PASSWORD_FIELD}    ${PASSWORD_MISSING_LOWERCASE}

user enters Password without special characters
    Input Text    ${PASSWORD_FIELD}    ${PASSWORD_MISSING_SPECIAL_CHARACTER}

# Logout Keywords
user clicks on My Account avatar
    Wait Until Element Is Visible    ${MY_ACCOUNT_MENU}
    Click Element    ${MY_ACCOUNT_MENU}

user clicks on Sign Out button
    Wait Until Element Is Visible    ${SIGN_OUT_BUTTON}    timeout=${TIMEOUT}
    Click Element    ${SIGN_OUT_BUTTON}

user Sign Out successfully
    Given user clicks on My Account avatar
    And user clicks on Sign Out button
    Then user should be redirected to Sign in screen

# Validation Message Verification Keywords
user should see User ID empty validation
    Wait Until Element Is Visible    ${VALIDATION_TEXT_EMPTY_USER_ID}    timeout=${TIMEOUT}

user should see User ID validation for less than 5 characters
    Wait Until Element Is Visible    ${VALIDATION_TEXT_LESS_THAN_5_CHARACTERS}    timeout=${TIMEOUT}

user should see User ID validation for more than 20 characters
    Wait Until Element Is Visible    ${VALIDATION_TEXT_MORE_THAN_20_CHARACTERS}    timeout=${TIMEOUT}

user should see User ID validation for special characters
    Wait Until Element Is Visible    ${VALIDATION_TEXT_CONTAIN_SPECIAL_CHARACTERS}    timeout=${TIMEOUT}

user should see User ID validation for spaces
    Wait Until Element Is Visible    ${VALIDATION_TEXT_CONTAIN_SPACES}    timeout=${TIMEOUT}

user should see Password empty validation
    Wait Until Element Is Visible    ${VALIDATION_TEXT_EMPTY_PASSWORD}    timeout=${TIMEOUT}

user should see Password validation for less than 8 characters
    Wait Until Element Is Visible    ${VALIDATION_TEXT_LESS_THAN_8_CHARACTERS}    timeout=${TIMEOUT}

user should see Password validation for spaces
    Wait Until Element Is Visible    ${VALIDATION_TEXT_CONTAIN_SPACES}    timeout=${TIMEOUT}

user should see Password validation for missing number
    Wait Until Element Is Visible    ${VALIDATION_TEXT_MISSING_NUMBER}    timeout=${TIMEOUT}

user should see Password validation for missing uppercase
    Wait Until Element Is Visible    ${VALIDATION_TEXT_MISSING_UPPERCASE}    timeout=${TIMEOUT}

user should see Password validation for missing lowercase
    Wait Until Element Is Visible    ${VALIDATION_TEXT_MISSING_LOWERCASE}    timeout=${TIMEOUT}

user should see Password validation for missing special character
    Wait Until Element Is Visible    ${VALIDATION_TEXT_MISSING_SPECIAL_CHARACTER}    timeout=${TIMEOUT}

user should see an Incorrect Account error message
    Wait Until Element Is Visible    ${INCORRECT_ACCOUNT_MESSAGE}

user should see a Deactivated Account error message
    Wait Until Element Is Visible    ${DEACTIVATED_ACCOUNT_MESSAGE}

user should see Report menu
    Wait Until Element Is Visible    ${REPORT_MENU}    timeout=${TIMEOUT}

user should be redirected to Sign in screen
    Wait Until Page Contains Element    ${WELCOME_SIGN_IN}    timeout=${TIMEOUT}


#API Keywords
#Owner sign in successfully
user click on Sign In button and send Owner valid credentials
    ${webdriver}=    Get Selenium Driver
    Setup API Capture Environment    ${webdriver}
    And user clicks Sign In button
    #Capture API
    ${signin_request}=    Wait for API Request    ${webdriver}    ${SIGNIN_ENDPOINT}    POST    10
    #Log
    Log everything of API Request    ${signin_request}
    Should Be Equal As Strings    ${signin_request['status']}    201
    
    #Parse payload
    ${signin_payload}=    Set Variable    ${signin_request['payload']}
    ${parse_signin_payload}=    Evaluate    json.loads('''${signin_payload}''')    json
    Should Be Equal    ${parse_signin_payload['type']}    ${TYPE_ORG_ADMIN}

    #Parse response
    ${signin_response}=    Set Variable    ${signin_request['response']}
    ${parse_signin_response}=    Evaluate    json.loads('''${signin_response}''')    json    

    #Get info in Sign In response
    ${data_of_signin}=    Set Variable    ${parse_signin_response['data']}
    ${info_of_signin}=    Set Variable    ${data_of_signin['info']}    

    #Log User ID
    Log    ${info_of_signin['user_code']}
    Should Be Equal    ${info_of_signin['user_code']}    ${OWNER_USER_ID}

    #Set message
    Set Log Request to Test Message    ${signin_request}
    bikip.Stop Network Interception    ${webdriver}

#Admin sign in successfully
user click on Sign In button and send Admin valid credentials
    ${webdriver}=    Get Selenium Driver
    Setup API Capture Environment    ${webdriver}
    And user clicks Sign In button
    #Capture API
    ${signin_request}=    Wait for API Request    ${webdriver}    ${SIGNIN_ENDPOINT}    POST    20
    #Log
    Log everything of API Request    ${signin_request}
    Should Be Equal As Strings    ${signin_request['status']}    201

    #Parse payload
    ${signin_payload}=    Set Variable    ${signin_request['payload']}
    ${parse_signin_payload}=    Evaluate    json.loads('''${signin_payload}''')    json
    Should Be Equal    ${parse_signin_payload['type']}    ${TYPE_MASTER_ADMIN}

    #Parse response
    ${signin_response}=    Set Variable    ${signin_request['response']}
    ${parse_signin_response}=    Evaluate    json.loads('''${signin_response}''')    json    
    Should Be Equal    ${parse_signin_response['message']}    SIGN_IN_SUCCESSFULLY

    #Get info in Sign In response
    ${data_of_signin}=    Set Variable    ${parse_signin_response['data']}
    ${info_of_signin}=    Set Variable    ${data_of_signin['info']}    

    #Log User ID
    Log    ${info_of_signin['user_code']}
    Should Be Equal    ${info_of_signin['user_code']}    ${ADMIN}
    Set Test Message    ${info_of_signin['user_code']}

    #Set message
    Set Log Request to Test Message    ${signin_request}
    bikip.Stop Network Interception    ${webdriver}

#Owner sign in unsuccessfully
user click on Sign in button and send Owner Incorrect credentials
    ${webdriver}=    Get Selenium Driver
    Setup API Capture Environment    ${webdriver}
    And user clicks Sign In button
    #Capture API
    ${signin_request}=    Wait for API Request    ${webdriver}    ${SIGNIN_ENDPOINT}    POST    10
    #Log
    Log everything of API Request    ${signin_request}
    Should Be Equal As Strings    ${signin_request['status']}    ${401_Unauthorized}    
    #Parse Payload
    ${signin_payload}=    Set Variable    ${signin_request['payload']}
    ${parse_signin_payload}=    Evaluate    json.loads('''${signin_payload}''')    json
    Should Be Equal    ${parse_signin_payload['password']}    ${INCORRECT_PASSWORD}
    #Set message
    Set Test Message    \n\nIncorrectPassword:${parse_signin_payload['password']}    append=True
    Set Log Request to Test Message    ${signin_request}
    bikip.Stop Network Interception    ${webdriver}

#Sign in by Deactivated account
user click on Sign in button and send Owner Deactivated credentials
    #Prepare
    ${webdriver}=    Get Selenium Driver
    Setup API Capture Environment    ${webdriver}
    And user clicks Sign In button
    #Capture API
    ${signin_request}=    Wait for API Request    ${webdriver}    ${SIGNIN_ENDPOINT}    POST    10
    #Log
    Log everything of API Request    ${signin_request}
    Should Be Equal As Strings    ${signin_request['status']}    ${401_Unauthorized}
    #Set message
    Set Log Request to Test Message    ${signin_request}
    bikip.Stop Network Interception    ${webdriver}

user click on Sign In button and send Owner valid credentials in Admin role
    #Prepare
    ${webdriver}=    Get Selenium Driver
    Setup API Capture Environment    ${webdriver}
    And user clicks Sign In button
    #Capture API
    ${signin_request}=    Wait for API Request    ${webdriver}    ${SIGNIN_ENDPOINT}    POST    10
    #Log
    Log everything of API Request    ${signin_request}
    Should Be Equal As Strings    ${signin_request['status']}    ${401_Unauthorized}
    #Set message
    Set Log Request to Test Message    ${signin_request}
    bikip.Stop Network Interception    ${webdriver}

user click on Sign In button and Send Admin invalid credentials in Admin role
    ${webdriver}=    Get Selenium Driver
    Setup API Capture Environment    ${webdriver}
    And user clicks Sign In button
    #Capture API
    ${signin_request}=    Wait for API Request    ${webdriver}    ${SIGNIN_ENDPOINT}    POST    10
    #Log
    Log everything of API Request    ${signin_request}
    Should Be Equal As Strings    ${signin_request['status']}    ${401_Unauthorized}
    #Set message
    Set Log Request to Test Message    ${signin_request}
    bikip.Stop Network Interception    ${webdriver}

user click on Sign Out button and system sign user out successfully
    #Prepare
    ${webdriver}=    Get Selenium Driver
    Setup API Capture Environment    ${webdriver}
    And user clicks on Sign Out button
    #Capture API
    ${signout_request}=    Wait for API Request    ${webdriver}    ${SIGNOUT_ENDPOINT}    POST    20
    #Log
    Log everything of API Request    ${signout_request}
    #Set message
    Set Log Request to Test Message    ${signout_request}
    bikip.Stop Network Interception    ${webdriver}