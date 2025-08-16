*** Variables ***
${DEV_URL}    https://app.panda.ennam.vn
${DEV_API}    https://api.panda.ennam.vn
${PROD_URL}     https://www.pandapay360.ca/
${BROWSER}     chrome
${TIMEOUT}    20s

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

${MY_ACCOUNT_MENU}    xpath=//*[@id="radix-:r1:"]

${PROFILE_MENU_BUTTON}    xpath=//*[@id="radix-:r2:"]/div[3]/a[1]/div

${CHANGE_PASSWORD_MENU_BUTTON}    xpath=//*[@id="radix-:r2:"]/div[3]/a[2]/div

${LANGUAGE_MENU_BUTTON}    xpath=//*[@id="radix-:r2:"]/div[3]/a[3]/div

${SIGN_OUT_BUTTON}    xpath=//*[@id="radix-:r2:"]/div[5][text()='Logout']