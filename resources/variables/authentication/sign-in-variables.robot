*** Variables ***
#Data
${OWNER_USER_ID}    bennguyen
${OWNER_EMAIL}    ben@yopmail.com
${ADMIN}    admin
${ADMIN_PASSWORD}    Exnodes123!@#
${OWNER_PASSWORD}    Dev123!@#
${INCORRECT_PASSWORD}    Dev123!@#$
${TYPE_ORG_ADMIN}    ORG_ADMIN
${TYPE_MASTER_ADMIN}    MASTER_ADMIN
${DEACTIVATED_USER_ID}    bennguyen2000
${DEACTIVATED_PASSWORD}    Dev123!@#
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

#Locator
${WELCOME_SIGN_IN}    xpath=//h1[text()='Welcome!']

${USERID_FIELD}     xpath=//input[@id="user_code"]

${PASSWORD_FIELD}     xpath=//input[@id="password"]

${SIGNIN_BUTTON}     xpath=//button[text()='Sign In']

${ADMIN_CHECKBOX_CHECKED}     xpath=//button[@role='checkbox' and @aria-checked='true']

${ADMIN_CHECKBOX_UNCHECKED}    xpath=//button[@role='checkbox' and @aria-checked='false']

${INCORRECT_ACCOUNT_MESSAGE}    xpath=//div[text()='Incorrect User ID or Password']

${DEACTIVATED_ACCOUNT_MESSAGE}    xpath=//div[text()='Account Deactivated. Please contact admin.']

${SIGNIN_SUCCESS_MESSAGE}    xpath=//div[text()='Login success']

${RETRIEVE_PASSWORD_BUTTON}    xpath=//a[text()='Retrieve password']



#Validation Text of User ID field

${VALIDATION_TEXT_EMPTY_USER_ID}    xpath=//p[text()='The User ID cannot be empty']

${VALIDATION_TEXT_USER_ID_CONTAIN_SPACES}    xpath=//p[text()='The User ID cannot be empty']

${VALIDATION_TEXT_LESS_THAN_5_CHARACTERS}    xpath=//p[text()='Username must be at least 5 characters.']

${VALIDATION_TEXT_MORE_THAN_20_CHARACTERS}    xpath=//p[text()='Username must be at most 20 characters.']

${VALIDATION_TEXT_CONTAIN_SPECIAL_CHARACTERS}    xpath=//p[text()='The User ID must be alphanumeric']


#Validation Text of Password field
${VALIDATION_TEXT_EMPTY_PASSWORD}    xpath=//p[text()='The Password cannot be empty']

${VALIDATION_TEXT_LESS_THAN_8_CHARACTERS}    xpath=//p[text()='Password must be at least 8 characters.']

${VALIDATION_TEXT_PASSWORD_CONTAIN_SPACES}    xpath=//p[text()='The Password cannot be empty']

${VALIDATION_TEXT_MISSING_NUMBER}    xpath=//p[text()='Password must contain at least one number.']

${VALIDATION_TEXT_MISSING_UPPERCASE}    xpath=//p[text()='Password must contain at least one uppercase letter.']

${VALIDATION_TEXT_MISSING_LOWERCASE}    xpath=//p[text()='Password must contain at least one lowercase letter.']

${VALIDATION_TEXT_MISSING_SPECIAL_CHARACTER}    xpath=//p[text()='Password must contain at least one special character.']