*** Settings ***
Resource    ../../resources/common/common_settings.robot
Library    DataDriver
Suite Setup    Basic Setup
Suite Teardown    Close PandaPay
Test Template    Sign in
*** Test Cases ***
Verify the system displays validation text when user input ${userid} and ${password}    Default    UserData    Expected

*** Keywords ***
Sign in
    [Arguments]    ${userid}    ${password}    ${expected}
    Input data in Element    ${USERID_FIELD}    ${userid}
    Input data in Element    ${PASSWORD_FIELD}    ${password}
    Wait Until Element Is Visible    ${expected}    5s