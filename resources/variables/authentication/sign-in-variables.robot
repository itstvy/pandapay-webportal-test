*** Variables ***
#Data
${OWNER_USER_ID}    bennguyen

${OWNER_EMAIL}    ben@yopmail.com

${ADMIN}    admin

${ADMIN_PASSWORD}    Exnodes123!@#

${OWNER_PASSWORD}    Dev123!@#

${TYPE_ORG_ADMIN}    ORG_ADMIN

${USER_ID_LESS_THAN_5}    annn

${USER_ID_MORE_THAN_20}    annstoreannstoreannstoreannstore

${user_ID_CONTAIN_SPECIAL_CHARACTERS}    annstore!@#

${USER_ID_CONTAIN_SPACES}    ${SPACE}

${USER_ID_EMPTY}     ${EMPTY}

${PASSWORD_EMPTY}    ${EMPTY}

${PASSWORD_LESS_THAN_8}    Dev123

${PASSWORD_CONTAIN_SPACES}    ${SPACE}

${PASSWORD_MISSING_NUMBER}    DevPassword!@

${PASSWORD_MISSING_UPPERCASE}    devpassword1234!@

${PASSWORD_MISSING_LOWERCASE}    DEVPASSWORD1234!@

${PASSWORD_MISSING_SPECIAL_CHARACTER}    DevPassword1234


#API ENDPOINT OF SIGN IN
${SIGNIN_ENDPOINT}    api/user/sign-in/

${PROFILE_ENDPOINT}    api/user/me/profile/

${EXPECTED_RESULT}    201


#Locator
${WELCOME_SIGN_IN}    xpath=//h1[text()='Welcome!']

${USERID_FIELD}     xpath=//*[@id="user_code"]

${PASSWORD_FIELD}     xpath=//*[@id="password"]

${SIGNIN_BUTTON}     xpath=/html/body/div[1]/div/div/div/div[2]/div/div/form/button

${ADMIN_CHECKBOX}     xpath=//*[@id="portal"]

${INCORRECT_ACCOUNT_MESSAGE}    xpath=/html/body/div[2]/ol/li/div/div[2]/div[text()='Incorrect User ID or Password']

${DEACTIVATED_ACCOUNT_MESSAGE}    xpath=/html/body/div[2]/ol/li/div/div[2]/div[text()='Account Deactivated. Please contact admin.']

${SIGNIN_SUCCESS_MESSAGE}    xpath=/html/body/div[2]/ol/li/div/div[2]/div[text()='Login success']

${RETRIEVE_PASSWORD_BUTTON}    xpath=/html/body/div[1]/div/div/div/div[2]/div/div/div/a



#Validation Text of User ID field

${VALIDATION_TEXT_EMPTY_USER_ID}    xpath=//*[@id=":r2:-form-item-message"][text()='The User ID cannot be empty']

${VALIDATION_TEXT_CONTAIN_SPACES}    xpath=//*[@id=":r2:-form-item-message"][text()='The User ID cannot be empty']

${VALIDATION_TEXT_LESS_THAN_5_CHARACTERS}    xpath=//*[@id=":r2:-form-item-message"][text()='Username must be at least 5 characters.']

${VALIDATION_TEXT_MORE_THAN_20_CHARACTERS}    xpath=//*[@id=":r2:-form-item-message"][text()='Username must be at most 20 characters.']

${VALIDATION_TEXT_CONTAIN_SPECIAL_CHARACTERS}    xpath=//*[@id=":r2:-form-item-message"][text()='The User ID must be alphanumeric']

#Validation Text of Password field
${VALIDATION_TEXT_EMPTY_PASSWORD}    xpath=//*[@id=":r3:-form-item-message"][text()='The Password cannot be empty']

${VALIDATION_TEXT_LESS_THAN_8_CHARACTERS}    xpath=//*[@id=":r3:-form-item-message"][text()='Password must be at least 8 characters.']

${VALIDATION_TEXT_CONTAIN_SPACES}    xpath=//*[@id=":r3:-form-item-message"][text()='The Password cannot be empty']

${VALIDATION_TEXT_MISSING_NUMBER}    xpath=//*[@id=":r3:-form-item-message"][text()='Password must contain at least one number.']

${VALIDATION_TEXT_MISSING_UPPERCASE}    xpath=//*[@id=":r3:-form-item-message"][text()='Password must contain at least one uppercase letter.']

${VALIDATION_TEXT_MISSING_LOWERCASE}    xpath=//*[@id=":r3:-form-item-message"][text()='Password must contain at least one lowercase letter.']

${VALIDATION_TEXT_MISSING_SPECIAL_CHARACTER}    xpath=//*[@id=":r3:-form-item-message"][text()='Password must contain at least one special character.']