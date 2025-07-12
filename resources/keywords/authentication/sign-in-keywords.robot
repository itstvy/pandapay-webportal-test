*** Settings ***
Resource    ../../../resources/common/common_settings.robot

*** Keywords ***
Open PandaPay
    Open Browser    ${DEV_URL}     ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${USERID_FIELD}
    Wait Until Page Contains Element    ${PASSWORD_FIELD}

Click on User ID field
    Click Element    ${USERID_FIELD}

Click on Password field
    Click Element    ${PASSWORD_FIELD}

Input correct Owner User ID
    Input Text    ${USERID_FIELD}    ${OWNER_USER_ID}

Input correct Admin User ID
    Input Text    ${USERID_FIELD}    ${ADMIN}

Input correct Admin Password
    Input Text    ${PASSWORD_FIELD}    ${ADMIN_PASSWORD}

Input correct Owner Password
    Input Text    ${PASSWORD_FIELD}    ${OWNER_PASSWORD}

Click Sign In Button
    Click Element    ${SIGNIN_BUTTON}

Click on Admin Checkbox
    Click Element    ${ADMIN_CHECKBOX}

Wait For Deactivate Account Message
    Element Should Be Visible    ${DEACTIVATED_ACCOUNT_MESSAGE}    timeout=${TIMEOUT}

Wait For Login Success Message
    Element Should Be Visible    ${SIGNIN_SUCCESS_MESSAGE}    timeout=${TIMEOUT}

Wait For Report Menu
    Wait Until Element Is Visible    ${REPORT_MENU}    timeout=${TIMEOUT}

Click on My Account avatar
    Wait Until Element Is Visible    ${MY_ACCOUNT_MENU}
    Click Element    ${MY_ACCOUNT_MENU}

Click on Sign Out Button
    Wait Until Element Is Visible    ${SIGN_OUT_BUTTON}    timeout=${TIMEOUT}
    Click Element    ${SIGN_OUT_BUTTON}

Wait for system navigate user back to Sign in screen
    Wait Until Page Contains Element    ${WELCOME_SIGN_IN}    timeout=${TIMEOUT}

Input User ID less than 5 characters
    Input Text    ${USERID_FIELD}    ${USER_ID_LESS_THAN_5}


Input User ID more than 20 characters
    Input Text    ${USERID_FIELD}    ${USER_ID_MORE_THAN_20}

Input User ID contain special characters
    Input Text    ${USERID_FIELD}    ${user_ID_CONTAIN_SPECIAL_CHARACTERS}

Input User ID contain spaces
    Input Text    ${USERID_FIELD}    ${USER_ID_CONTAIN_SPACES}

Do not input User ID
    Input Text    ${USERID_FIELD}    ${USER_ID_EMPTY}

Do not input Password
    Input Text    ${PASSWORD_FIELD}    ${PASSWORD_EMPTY}

Input Password less than 8 characters
    Input Text    ${PASSWORD_FIELD}    ${PASSWORD_LESS_THAN_8}

Input Password contain spaces
    Input Text    ${PASSWORD_FIELD}    ${PASSWORD_CONTAIN_SPACES}

Input Password missing number
    Input Text    ${PASSWORD_FIELD}    ${PASSWORD_MISSING_NUMBER}

Input Password missing uppercase
    Input Text    ${PASSWORD_FIELD}    ${PASSWORD_MISSING_UPPERCASE}

Input Password missing lowercase
    Input Text    ${PASSWORD_FIELD}    ${PASSWORD_MISSING_LOWERCASE}

Input Password missing special character
    Input Text    ${PASSWORD_FIELD}    ${PASSWORD_MISSING_SPECIAL_CHARACTER}


Wait for Validation Text of User ID less than 5 characters
    Element Should Be Visible    ${VALIDATION_TEXT_LESS_THAN_5_CHARACTERS}    timeout=${TIMEOUT}

Wait for Validation Text of User ID more than 20 characters
    Element Should Be Visible    ${VALIDATION_TEXT_MORE_THAN_20_CHARACTERS}    timeout=${TIMEOUT}

Wait for Validation Text of User ID contain spaces
    Element Should Be Visible    ${VALIDATION_TEXT_CONTAIN_SPACES}    timeout=${TIMEOUT}

Wait for Validation Text of User ID contain special characters
    Element Should Be Visible    ${VALIDATION_TEXT_CONTAIN_SPECIAL_CHARACTERS}    timeout=${TIMEOUT}

Wait for Validation Text of User ID empty
    Element Should Be Visible    ${VALIDATION_TEXT_EMPTY_USER_ID}    timeout=${TIMEOUT}

Wait for Validation Text of Password empty
    Element Should Be Visible    ${VALIDATION_TEXT_EMPTY_PASSWORD}    timeout=${TIMEOUT}

Wait for Validation Text of Password less than 8 characters
    Element Should Be Visible    ${VALIDATION_TEXT_LESS_THAN_8_CHARACTERS}    timeout=${TIMEOUT}

Wait for Validation Text of Password contain spaces
    Element Should Be Visible    ${VALIDATION_TEXT_CONTAIN_SPACES}    timeout=${TIMEOUT}

Wait for Validation Text of Password missing number
    Element Should Be Visible    ${VALIDATION_TEXT_MISSING_NUMBER}    timeout=${TIMEOUT}

Wait for Validation Text of Password missing uppercase
    Element Should Be Visible    ${VALIDATION_TEXT_MISSING_UPPERCASE}    timeout=${TIMEOUT}

Wait for Validation Text of Password missing lowercase
    Element Should Be Visible    ${VALIDATION_TEXT_MISSING_LOWERCASE}    timeout=${TIMEOUT}

Wait for Validation Text of Password missing special character
    Element Should Be Visible    ${VALIDATION_TEXT_MISSING_SPECIAL_CHARACTER}    timeout=${TIMEOUT}




