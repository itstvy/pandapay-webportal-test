*** Settings ***
Resource    ../../../resources/common/common_settings.robot

*** Variables ***
#Locators of CHANGE PASSWORD elements
${CHANGE_PASSWORD_TITLE}    xpath=/html/body/div[1]/div/main/div/form/div[1]/h2[text()='Change Password']
${SUBMIT_CHANGE_PASSWORD_BUTTON_1}    xpath=/html/body/div[1]/div/main/div/form/div[1]/button[text()='Submit']
${SUBMIT_CHANGE_PASSWORD_BUTTON_2}    xpath=/html/body/div[1]/div/main/div/form/button[text()='Submit']

${CURRENT_PASSWORD_FIELD}    xpath=//input[@id="current_password"]
${NEW_PASSWORD_FIELD}    xpath=//input[@id="new_password"]
${CONFIRM_NEW_PASSWORD_FIELD}    xpath=//input[@id="confirm_new_password"]

#Correct New Current Password
${CORRECT_CURRENT_PASSWORD}    Exnodes123!@#
${INCORRECT_CURRENT_PASSWORD}    Mobi1234@
${VALID_NEW_PASSWORD}    Dev123!@#
${VALID_CONFIRM_NEW_PASSWORD}    ${VALID_NEW_PASSWORD}
${NOT_MATCH_NEW_PASSWORD}    Mobi1234@

#Validation Text
#Current Password field
${VALIDATION_CURRENT_PASSWORD_EMPTY}    xpath=//p[normalize-space(text())='Please enter your current password']
${VALIDATION_CURRENT_PASSWORD_LESS_THAN_8_CHARACTERS}    xpath=//p[normalize-space(text())='Password must be at least 8 characters']
${VALIDATION_CURRENT_PASSWORD_MISSING_UPPERCASE}    xpath=//p[normalize-space(text())='Password must contain at least one uppercase letter']
${VALIDATION_CURRENT_PASSWORD_MISSING_LOWERCASE}    xpath=//p[normalize-space(text())='Password must contain at least one lowercase letter']
${VALIDATION_CURRENT_PASSWORD_MISSING_NUMBER}    xpath=//p[normalize-space(text())='Password must contain at least one number']
${VALIDATION_CURRENT_PASSWORD_MISSING_SPECIAL_CHARACTERS}    xpath=//p[normalize-space(text())='Password must contain at least one special character']

${VALIDATION_NEW_PASSWORD_EMPTY}    xpath=//p[normalize-space(text())='Please enter your new password']
${VALIDATION_NEW_PASSWORD_LESS_THAN_8_CHARACTERS}    xpath=//p[normalize-space(text())='Password must be at least 8 characters']
${VALIDATION_NEW_PASSWORD_MISSING_UPPERCASE}    xpath=//p[normalize-space(text())='Password must contain at least one uppercase letter']
${VALIDATION_NEW_PASSWORD_MISSING_LOWERCASE}    xpath=//p[normalize-space(text())='Password must contain at least one lowercase letter']
${VALIDATION_NEW_PASSWORD_MISSING_NUMBER}    xpath=//p[normalize-space(text())='Password must contain at least one number']
${VALIDATION_NEW_PASSWORD_MISSING_SPECIAL_CHARACTERS}    xpath=//p[normalize-space(text())='Password must contain at least one special character']

${VALIDATION_CONFIRM_NEW_PASSWORD_EMPTY}    xpath=//p[normalize-space(text())='Please enter your confirm new password']
${VALIDATION_CONFIRM_NEW_PASSWORD_NOT_MATCH}    xpath=//p[contains(text(),"Passwords don't match")]

#Success message
${SUCCESS_CHANGE_PASSWORD_MESSAGE}    xpath=//div[normalize-space(text())='Password changed successfully.']