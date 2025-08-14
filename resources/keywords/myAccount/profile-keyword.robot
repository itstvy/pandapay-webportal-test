*** Settings ***
Resource    ../../../resources/common/common_settings.robot

*** Keywords ***
user should see a Profile menu button
    Wait Until Element Is Visible    ${PROFILE_MENU_BUTTON}

user click on the Profile menu button
    Click Element    ${PROFILE_MENU_BUTTON}

the system displays the Change User Information screen
    Sleep    5s
    Wait Until Element Is Visible     ${CHANGE_USER_INFORMATION_TITLE}