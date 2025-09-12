*** Settings ***
Resource    ../../../resources/common/common_settings.robot

*** Variables ***
#Locators of PROFIE-CHANGE USER INFORMATION elements
${CHANGE_USER_INFORMATION_TITLE}    xpath=/html/body/div[1]/div/main/div/form/div[1]/h2[text()='Change User Information']
${USER_INFORMATION_TITLE}    xpath=/html/body/div[1]/div/main/div/form/div[2]/h4[text()='User Information']
${SUBMIT_PROFILE_BUTTON_1}    xpath=/html/body/div[1]/div/main/div/form/div[1]/button[text()='Submit']
${PROFILE_FIRST_NAME_FIELD}    xpath=//*[@id="first_name"]
${PROFILE_LAST_NAME_FIELD}    xpath=//*[@id="last_name"]
${PROFILE_ADDRESS_FIELD}    xpath=//*[@name='address']
${SUBMIT_PROFILE_BUTTON_2}    xpath=/html/body/div[1]/div/main/div/form/button[text()='Submit']
${REMOVE_UPLOADED_AVATAR}    xpath=/html/body/div[1]/div/main/div/form/div[2]/div[1]/div/button
${UPLOAD_AVATAR}    xpath=/html/body/div[1]/div/main/div/form/div[2]/div[1]/div/div[text()='Upload Avatar']


#Profile Data
${NEW_FIRST_NAME}    Vy
${NEW_LAST_NAME}    Nguyen
${NEW_ADRESS}    1090 NW 1st Avennue

#Message
${UPDATE_PROFILE_SUCCESS}    xpath=/html/body/div[2]/ol/li/div/div[text()='Information updated successfully']

#Validation Text

${VALIDATION_FIRST_NAME_IS_REQUIRED}    xpath=//input[@id='first_name']/following-sibling::p[normalize-space(text())='First name is required.']
${VALIDATION_FIRST_NAME_LESS_THAN_2_CHARACTERS}    xpath=//input[@id='first_name']/following-sibling::p[normalize-space(text())='First name must be at least 2 characters']
${VALIDATION_FIRST_NAME_MORE_THAN_50_CHARACTERS}    xpath=//input[@id='first_name']/following-sibling::p[normalize-space(text())='First name must be at most 50 characters']

${VALIDATION_LAST_NAME_IS_REQUIRED}    xpath=//input[@id='last_name']/following-sibling::p[normalize-space(text())='Last name is required.']
${VALIDATION_LAST_NAME_LESS_THAN_2_CHARACTERS}    xpath=//input[@id='last_name']/following-sibling::p[normalize-space(text())='Last name must be at least 2 characters']
${VALIDATION_LAST_NAME_MORE_THAN_50_CHARACTERS}    xpath=//input[@id='last_name']/following-sibling::p[normalize-space(text())='Last name must be at most 50 characters']

# ${FIRST_NAME_CONTAIN_ONLY_SPACES}    xpath=//input[@id='first_name']/following-sibling::p[normalize-space(text())='First name is required.']
# ${LAST_NAME_CONTAIN_ONLY_SPACES}    xpath=//*[@id=":ra:-form-item-message"][text()='Last name is required.']
# ${ADDRESS_CONTAIN_ONLY_SPACES}    xpath=//*[@id=":rc:-form-item-message"][text()='Address cannot contain only spaces']

${VALIDATION_ADDRESS_LESS_THAN_5_CHARACTERS}    xpath=//input[@name='address']/following-sibling::p[normalize-space(text())='Address must be between 5 and 100 characters']
${VALIDATION_ADDRESS_MORE_THAN_100_CHARACTERS}    xpath=//input[@name='address']/following-sibling::p[normalize-space(text())='Address must be between 5 and 100 characters']

