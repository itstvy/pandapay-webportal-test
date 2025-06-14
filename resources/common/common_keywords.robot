*** Settings ***
Resource    ../../resources/common/common_settings.robot
Resource    ../../resources/common/common_variables.robot
Resource    ../../resources/keywords/authentication/sign-in-keywords.robot

*** Keywords ***
Open Sign in PandaPay
    Open Browser    ${DEV_URL}/login    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible  ${USERID_FIELD}    10s
    Wait Until Element Is Visible    ${PASSWORD_FIELD}    10s

Close Browsers
    Close All Browsers