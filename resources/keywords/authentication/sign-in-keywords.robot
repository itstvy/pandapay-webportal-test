*** Settings ***
Resource    ../../../resources/variables/authentication/sign-in-variables.robot
Resource    ../../../resources/common/common_variables.robot
Resource    ../../../resources/common/common_settings.robot

*** Keywords *** 
Open Sign In Page
    Open Browser    ${DEV_URL}/login   ${BROWSER}
    Maximize Browser Window

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
    Wait Until Element Is Visible    ${DEACTIVATED_ACCOUNT_MESSAGE}    timeout=${TIMEOUT}

Wait For Login Success Message
    Wait Until Element Is Visible    ${SIGNIN_SUCCESS_MESSAGE}    timeout=${TIMEOUT}    

Wait For Report Menu
    Wait Until Element Is Visible    ${REPORT_MENU}    timeout=${TIMEOUT}

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
    Input Text    ${PASSWORD_FIELD}    ${PASSWORN_CONTAIN_SPACES}

Input Password missing number
    Input Text    ${PASSWORD_FIELD}    ${PASSWORD_MISSING_NUMBER}

Input Password missing uppercase
    Input Text    ${PASSWORD_FIELD}    ${PASSWORD_MISSING_UPPERCASE}

Input Password missing lowercase
    Input Text    ${PASSWORD_FIELD}    ${PASSWORD_MISSING_LOWERCASE}

Input Password missing special character
    Input Text    ${PASSWORD_FIELD}    ${PASSWORD_MISSING_SPECIAL_CHARACTER}


Wait for Validation Text of User ID less than 5 characters
    Wait Until Element Is Visible    ${VALIDATION_TEXT_LESS_THAN_5_CHARACTERS}    timeout=${TIMEOUT}

Wait for Validation Text of User ID more than 20 characters
    Wait Until Element Is Visible    ${VALIDATION_TEXT_MORE_THAN_20_CHARACTERS}    timeout=${TIMEOUT}

Wait for Validation Text of User ID contain spaces
    Wait Until Element Is Visible    ${VALIDATION_TEXT_CONTAIN_SPACES}    timeout=${TIMEOUT}

Wait for Validation Text of User ID contain special characters
    Wait Until Element Is Visible    ${VALIDATION_TEXT_CONTAIN_SPECIAL_CHARACTERS}    timeout=${TIMEOUT}

Wait for Validation Text of User ID empty
    Wait Until Element Is Visible    ${VALIDATION_TEXT_EMPTY_USER_ID}    timeout=${TIMEOUT}

Wait for Validation Text of Password empty
    Wait Until Element Is Visible    ${VALIDATION_TEXT_EMPTY_PASSWORD}    timeout=${TIMEOUT}

Wait for Validation Text of Password less than 8 characters
    Wait Until Element Is Visible    ${VALIDATION_TEXT_LESS_THAN_8_CHARACTERS}    timeout=${TIMEOUT}

Wait for Validation Text of Password contain spaces
    Wait Until Element Is Visible    ${VALIDATION_TEXT_CONTAIN_SPACES}    timeout=${TIMEOUT}

Wait for Validation Text of Password missing number
    Wait Until Element Is Visible    ${VALIDATION_TEXT_MISSING_NUMBER}    timeout=${TIMEOUT}

Wait for Validation Text of Password missing uppercase
    Wait Until Element Is Visible    ${VALIDATION_TEXT_MISSING_UPPERCASE}    timeout=${TIMEOUT}

Wait for Validation Text of Password missing lowercase
    Wait Until Element Is Visible    ${VALIDATION_TEXT_MISSING_LOWERCASE}    timeout=${TIMEOUT}

Wait for Validation Text of Password missing special character
    Wait Until Element Is Visible    ${VALIDATION_TEXT_MISSING_SPECIAL_CHARACTER}    timeout=${TIMEOUT}



