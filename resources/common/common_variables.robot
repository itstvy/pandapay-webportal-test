*** Variables ***
${DEV_URL}    https://app.panda.ennam.vn
${DEV_API}    https://api.panda.ennam.vn
${PROD_URL}     https://www.pandapay360.ca/
${BROWSER}     chrome
${TIMEOUT}    20s

#Locators of All Pages
${REPORT_MENU}     xpath=/html/body/div[1]/header/div/div[1]/div/a[6]/button[text()='Report']

#My Account Menu Locators

${MY_ACCOUNT_MENU}    xpath=//*[@id="radix-:r1:"]

${PROFILE_MENU_BUTTON}    xpath=//*[@id="radix-:r2:"]/div[3]/a[1]/div

${CHANGE_PASSWORD_MENU_BUTTON}    xpath=//*[@id="radix-:r2:"]/div[3]/a[2]/div

${LANGUAGE_MENU_BUTTON}    xpath=//*[@id="radix-:r2:"]/div[3]/a[3]/div

${SIGN_OUT_BUTTON}    xpath=//*[@id="radix-:r2:"]/div[5][text()='Logout']