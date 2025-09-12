*** Settings ***
Resource    ../../../resources/common/common_settings.robot

*** Keywords ***
user clicks on the Change Password menu button
    Wait Until Element Is Visible    ${CHANGE_PASSWORD_MENU_BUTTON}
    Click Element    ${CHANGE_PASSWORD_MENU_BUTTON}
system displays Change Password screen
    Wait Until Element Is Visible    ${CHANGE_PASSWORD_TITLE}

user is on Change Password screen
    Wait Until Element Is Visible    ${CHANGE_PASSWORD_TITLE}

#Current Password
user enters correct current password in Current Password field
    Wait Until Element Is Visible    ${CURRENT_PASSWORD_FIELD}
    Input Text    ${CURRENT_PASSWORD_FIELD}    ${CORRECT_CURRENT_PASSWORD}

user leaves Current Password field empty
    Wait Until Element Is Visible    ${CURRENT_PASSWORD_FIELD}
    

#New Password
user enters valid data in New Password field
    Wait Until Element Is Visible    ${NEW_PASSWORD_FIELD}
    Input Text    ${NEW_PASSWORD_FIELD}    ${VALID_NEW_PASSWORD} 

#Confirm New Password
user enters valid data in Confirm Password field
    Wait Until Element Is Visible    ${CONFIRM_NEW_PASSWORD_FIELD}
    Input Text    ${CONFIRM_NEW_PASSWORD_FIELD}    ${VALID_CONFIRM_NEW_PASSWORD}

user press on Submit form button
    Wait Until Element Is Visible    ${SUBMIT_CHANGE_PASSWORD_BUTTON_1}
    Click Element    ${SUBMIT_CHANGE_PASSWORD_BUTTON_1}

#Message & Validation
system displays success message
    Wait Until Element Is Visible    ${SUCCESS_CHANGE_PASSWORD_MESSAGE}