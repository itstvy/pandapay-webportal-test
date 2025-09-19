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
    Wait Until Element Is Visible    ${CURRENT_PASSWORD_FIELD}
    Wait Until Element Is Visible    ${NEW_PASSWORD_FIELD}
    Wait Until Element Is Visible    ${CONFIRM_NEW_PASSWORD_FIELD}

#Valid data in Current, New, Confirm fields
user enters correct current password in Current Password field
    Input Text    ${CURRENT_PASSWORD_FIELD}    ${CORRECT_CURRENT_PASSWORD}

user enters valid data in New Password field
    Input Text    ${NEW_PASSWORD_FIELD}    ${VALID_NEW_PASSWORD} 

user enters valid data in Confirm New Password field
    Input Text    ${CONFIRM_NEW_PASSWORD_FIELD}    ${VALID_CONFIRM_NEW_PASSWORD}

#Invalid data in Current, New, Confirm fields
user leaves Current Password, New Password, Confirm New Password fields empty
    Click Element    ${CURRENT_PASSWORD_FIELD}
    Click Element    ${NEW_PASSWORD_FIELD}
    Click Element    ${CONFIRM_NEW_PASSWORD_FIELD}
    Click Element    ${SUBMIT_CHANGE_PASSWORD_BUTTON_2}

system displays validation texts when data in Current Password, New Password, Confirm New Password fields are empty
    Wait Until Element Is Visible    ${VALIDATION_CURRENT_PASSWORD_EMPTY}
    Wait Until Element Is Visible    ${VALIDATION_NEW_PASSWORD_EMPTY}
    Wait Until Element Is Visible    ${VALIDATION_CONFIRM_NEW_PASSWORD_EMPTY}

user enters data less than 8 characters in Current Password, New Password, Confirm New Password fields
    Input Text    ${CURRENT_PASSWORD_FIELD}    ${LESS_THAN_8_CHARACTERS}
    Input Text    ${NEW_PASSWORD_FIELD}    ${LESS_THAN_8_CHARACTERS}
    Input Text    ${CONFIRM_NEW_PASSWORD_FIELD}    ${LESS_THAN_8_CHARACTERS}

system displays validation text when Current Password, New Password fields have fewer than 8 characters
    Wait Until Element Is Visible    ${VALIDATION_CURRENT_PASSWORD_LESS_THAN_8_CHARACTERS}
    Wait Until Element Is Visible    ${VALIDATION_NEW_PASSWORD_LESS_THAN_8_CHARACTERS}

user enters data missing Uppercase in Current Password, New Password fields
    Input Text    ${CURRENT_PASSWORD_FIELD}    ${MISSING_UPPERCASE}
    Input Text    ${NEW_PASSWORD_FIELD}    ${MISSING_UPPERCASE}

system displays validation text when data in Current Password, New Password fields are missing uppercase
    Wait Until Element Is Visible    ${VALIDATION_CURRENT_PASSWORD_MISSING_UPPERCASE}
    Wait Until Element Is Visible    ${VALIDATION_NEW_PASSWORD_MISSING_UPPERCASE}

user enters data missing Lowercase in Current Password, New Password fields
    Input Text    ${CURRENT_PASSWORD_FIELD}    ${MISSING_LOWERCASE}
    Input Text    ${NEW_PASSWORD_FIELD}    ${MISSING_LOWERCASE}

system displays validation text when data in Current Password, New Password fields are missing lowercase
    Wait Until Element Is Visible    ${VALIDATION_CURRENT_PASSWORD_MISSING_LOWERCASE}
    Wait Until Element Is Visible    ${VALIDATION_NEW_PASSWORD_MISSING_LOWERCASE}
    
user enters data missing Number in Current Password, New Password fields
    Input Text    ${CURRENT_PASSWORD_FIELD}    ${MISSING_NUMBER}
    Input Text    ${NEW_PASSWORD_FIELD}    ${MISSING_NUMBER}

system displays validation text when data in Current Password, New Password fields are missing number
    Wait Until Element Is Visible    ${VALIDATION_NEW_PASSWORD_MISSING_NUMBER}
    Wait Until Element Is Visible    ${VALIDATION_CURRENT_PASSWORD_MISSING_NUMBER}

user enters data missing Special Character in Current Password, New Password fields
    Input Text    ${CURRENT_PASSWORD_FIELD}    ${MISSING_SPECIAL_CHARACTERS}
    Input Text    ${NEW_PASSWORD_FIELD}    ${MISSING_SPECIAL_CHARACTERS}

system displays validation text when data in Current Password, New Password fields are missing special characters
    Wait Until Element Is Visible    ${VALIDATION_CURRENT_PASSWORD_MISSING_SPECIAL_CHARACTERS}
    Wait Until Element Is Visible    ${VALIDATION_NEW_PASSWORD_MISSING_SPECIAL_CHARACTERS}

user enters data in Confirm New Password field NOT MATCH with New Password field
    Input Text    ${CURRENT_PASSWORD_FIELD}    ${CORRECT_CURRENT_PASSWORD}
    Input Text    ${NEW_PASSWORD_FIELD}    ${VALID_NEW_PASSWORD} 
    Input Text    ${CONFIRM_NEW_PASSWORD_FIELD}    ${NOT_MATCH_NEW_PASSWORD}
    Click Element    ${SUBMIT_CHANGE_PASSWORD_BUTTON_2}

system displays validation text when Confirm New Password NOT MATCH with New Password
    Wait Until Element Is Visible    ${VALIDATION_CONFIRM_NEW_PASSWORD_NOT_MATCH}

#Message & Validation
system displays success message
    Wait Until Element Is Visible    ${SUCCESS_CHANGE_PASSWORD_MESSAGE}

user press on Submit form button
    Wait Until Element Is Visible    ${SUBMIT_CHANGE_PASSWORD_BUTTON_1}
    Click Element    ${SUBMIT_CHANGE_PASSWORD_BUTTON_1}


