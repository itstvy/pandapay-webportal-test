*** Settings ***
Resource    ../../../resources/variables/authentication/sign-in-variables.robot
Resource    ../../../resources/common/common_variables.robot
Resource    ../../../resources/common/common_settings.robot

*** Keywords ***
# Basic Navigation Keywords
user is on the sign in page
    Wait Until Page Contains Element    ${USERID_FIELD}
    Wait Until Page Contains Element    ${PASSWORD_FIELD}

# Input Field Interaction Keywords
user clicks on User ID field
    Click Element    ${USERID_FIELD}

user clicks on Password field
    Click Element    ${PASSWORD_FIELD}

user clicks Sign In button
    Click Element    ${SIGNIN_BUTTON}

# User ID Input Keywords
user enters Owner User ID
    Input Text    ${USERID_FIELD}    ${OWNER_USER_ID}

user enters Admin User ID
    Input Text    ${USERID_FIELD}    ${ADMIN}

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

# Validation Message Verification Keywords
user should see User ID empty validation
    Element Should Be Visible    ${VALIDATION_TEXT_EMPTY_USER_ID}    timeout=${TIMEOUT}

user should see User ID validation for less than 5 characters
    Element Should Be Visible    ${VALIDATION_TEXT_LESS_THAN_5_CHARACTERS}    timeout=${TIMEOUT}

user should see User ID validation for more than 20 characters
    Element Should Be Visible    ${VALIDATION_TEXT_MORE_THAN_20_CHARACTERS}    timeout=${TIMEOUT}

user should see User ID validation for special characters
    Element Should Be Visible    ${VALIDATION_TEXT_CONTAIN_SPECIAL_CHARACTERS}    timeout=${TIMEOUT}

user should see User ID validation for spaces
    Element Should Be Visible    ${VALIDATION_TEXT_CONTAIN_SPACES}    timeout=${TIMEOUT}

user should see Password empty validation
    Element Should Be Visible    ${VALIDATION_TEXT_EMPTY_PASSWORD}    timeout=${TIMEOUT}

user should see Password validation for less than 8 characters
    Element Should Be Visible    ${VALIDATION_TEXT_LESS_THAN_8_CHARACTERS}    timeout=${TIMEOUT}

user should see Password validation for spaces
    Element Should Be Visible    ${VALIDATION_TEXT_CONTAIN_SPACES}    timeout=${TIMEOUT}

user should see Password validation for missing number
    Element Should Be Visible    ${VALIDATION_TEXT_MISSING_NUMBER}    timeout=${TIMEOUT}

user should see Password validation for missing uppercase
    Element Should Be Visible    ${VALIDATION_TEXT_MISSING_UPPERCASE}    timeout=${TIMEOUT}

user should see Password validation for missing lowercase
    Element Should Be Visible    ${VALIDATION_TEXT_MISSING_LOWERCASE}    timeout=${TIMEOUT}

user should see Password validation for missing special character
    Element Should Be Visible    ${VALIDATION_TEXT_MISSING_SPECIAL_CHARACTER}    timeout=${TIMEOUT}

user should see Report menu
    Wait Until Element Is Visible    ${REPORT_MENU}    timeout=${TIMEOUT}

user should be redirected to Sign in screen
    Wait Until Page Contains Element    ${WELCOME_SIGN_IN}    timeout=${TIMEOUT}
