*** Variables ***
${PANDAPAY_URL}    https://app.panda.ennam.vn
${DEV_API}    https://api.panda.ennam.vn
${PROD_URL}     https://www.pandapay360.ca/
${BROWSER}     chrome
${TIMEOUT}    10s

#Route
#Authentication
${LOGIN_URL}    ${PANDAPAY_URL}/login

#My Account
${CHANGE_LANGUAGE_URL}    ${PANDAPAY_URL}/account/language-change
${CHANGE_PROFILE_URL}    ${PANDAPAY_URL}/account/change-information
${CHANGE_PASSWORD_URL}    ${PANDAPAY_URL}/account/change-password

#User
${USER_URL}    ${PANDAPAY_URL}/user-management/list

#Status Code
${201_Created}    201
${202_Accepted}    202
${401_Unauthorized}    401

#API Endpoint
#SIGN IN
${SIGNIN_ENDPOINT}    api/user/sign-in/
${SIGNOUT_ENDPOINT}    api/logout/
#PROFILE
${PROFILE_ENDPOINT}    api/user/me/profile/
#USER
${USER_LIST_ENDPOINT}    api/admin/user/
#ORGANIZATION
${ORGANIZATION_DETAILS_ENDPOINT}    api/organization/


#Common Data Input
${DATA_EMPTY}    ${EMPTY}
${ONLY_SPACES}    ${SPACE}
${CONTAIN_SPACES}    ${SPACE}abcd${SPACE}
${LESS_THAN_2_CHARACTERS}    a
${LESS_THAN_5_CHARACTERS}    abcd
${MORE_THAN_20_CHARACTERS}    AbcdefhijkAbcdefhijk!@#
${MORE_THAN_50_CHARACTERS}    AbcdefhijkAbcdefhijkAbcdefhijkAbcdefhijkAbcdefhijk!@#
${MORE_THAN_100_CHARACTERS}    AbcdefhijkAbcdefhijkAbcdefhijkAbcdefhijkAbcdefhijkAbcdefhijkAbcdefhijkAbcdefhijkAbcdefhijkAbcdefhijk!@#


#Common Password Data
${LESS_THAN_8_CHARACTERS}    Dev123@
${MISSING_NUMBER}    Dev!!@@##
${MISSING_SPECIAL_CHARACTERS}    Dev123456
${MISSING_UPPERCASE}    dev123!@#
${MISSING_LOWERCASE}    DEV123!@#
${PASSWORD_CONTAIN_SPACES}    ${SPACE}Dev123!@#${SPACE}


#Locators of All Pages
${REPORT_MENU}     xpath=/html/body/div[1]/header/div/div[1]/div/a[6]/button[text()='Report']

#My Account Menu Locators

${MY_ACCOUNT_MENU}    xpath=//span/img[@alt='User Avatar']

${PROFILE_MENU_BUTTON}    xpath=//div[normalize-space(text())='Profile']

${CHANGE_PASSWORD_MENU_BUTTON}    xpath=//div[normalize-space(text())='Change Password']

${LANGUAGE_MENU_BUTTON}    xpath=//div[normalize-space(text())='Language']

${SIGN_OUT_BUTTON}    xpath=//div[normalize-space(text())='Logout']

#Header
${USER_MENU_BUTTON}    xpath=//button[contains(text(),"User")]