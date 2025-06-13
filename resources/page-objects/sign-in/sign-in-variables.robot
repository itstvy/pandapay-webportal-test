*** Variables ***
#Locator
${USERID_FIELD}     xpath=//*[@id="user_code"]
${PASSWORD_FIELD}     xpath=//*[@id="password"]
${SIGNIN_BUTTON}     xpath=/html/body/div[1]/div/div/div/div[2]/div/div/form/button
${ADMIN_CHECKBOX}     xpath=//*[@id="portal"]
${INCORRECT_ACCOUNT_MESSAGE}    xpath=/html/body/div[2]/ol/li/div/div[2]/div[text()='Incorrect User ID or Password']
${DEACTIVATED_ACCOUNT_MESSAGE}    xpath=/html/body/div[2]/ol/li/div/div[2]/div[text()='Account Deactivated. Please contact admin.']
${SIGNIN_SUCCESS_MESSAGE}    xpath=/html/body/div[2]/ol/li/div/div[2]/div[text()='Login success']
${RETRIEVE_PASSWORD_BUTTON}    xpath=/html/body/div[1]/div/div/div/div[2]/div/div/div/a
${ENDPOINT_RETRIEVE_PASSWORD}    /retrieve
${REPORT_MENU}     xpath=/html/body/div[1]/header/div/div[1]/div/a[6]/button

#Data
${USER_ID}    annstore
${PASSWORD}    Dev1234!@#
${TYPE_ORG_ADMIN}    ORG_ADMIN

#API ENDPOINT OF SIGN IN
${SIGNIN_ENDPOINT}    /api/user/sign-in/
${STATUS_201}    201
