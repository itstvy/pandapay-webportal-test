*** Settings ***
Resource    ../../../resources/page-objects/sign-in/sign-in-variables.robot
Resource    ../../../resources/common/common_variables.robot
Resource    ../../../resources/common/common_settings.robot

*** Keywords *** 
Open Sign In Page
    Open Browser    ${DEV_URL}/login   ${BROWSER}
    Maximize Browser Window

Input User ID
    Input Text    ${USERID_FIELD}    ${USER_ID}

Input Password
    Input Text    ${PASSWORD_FIELD}    ${PASSWORD}

Click Sign In Button
    Click Element    ${SIGNIN_BUTTON}

Wait For Deactivate Message
    Wait Until Element Is Visible    ${DEACTIVATED_ACCOUNT_MESSAGE}    timeout=${TIMEOUT}

Wait For Success Message
    Wait Until Element Is Visible    ${SIGNIN_SUCCESS_MESSAGE}    timeout=${TIMEOUT}    

Wait For Report Menu
    Wait Until Element Is Visible    ${REPORT_MENU}    timeout=${TIMEOUT}


    


