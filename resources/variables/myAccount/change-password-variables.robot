*** Settings ***
Resource    ../../../resources/common/common_settings.robot

*** Variables ***
#Locators of CHANGE PASSWORD elements
${CHANGE_PASSWORD_TITLE}    xpath=/html/body/div[1]/div/main/div/form/div[1]/h2[text()='Change Password']
${SUBMIT_CHANGE_PASSWORD_BUTTON_1}    xpath=/html/body/div[1]/div/main/div/form/div[1]/button[text()='Submit']
${SUBMIT_CHANGE_PASSWORD_BUTTON_2}    xpath=/html/body/div[1]/div/main/div/form/button[text()='Submit']
${CURRENT_PASSWORD_FIELD}    xpath=//*[@id="current_password"]
${NEW_PASSWORD_FIELD}    xpath=//*[@id="new_password"]
${CONFIRM_NEW_PASSWORD_FIELD}    xpath=//*[@id="confirm_new_password"]