*** Settings ***
Resource    ../../../resources/common/common_settings.robot

*** Variables ***
#Locators of CHANGE LANGUAGE elements
${CHANGE_LANGUAGE_TITLE}    xpath=/html/body/div[1]/div/main/div/div[1]/h2[text()='Language Change']
${ENGLISH_IS_OFF}    xpath=/html/body/div[1]/div/main/div/div[2]/div[1][.//text()[normalize-space()='English']]//button[@data-state='checked']
${ENGLISH_IS_ON}     xpath=/html/body/div[1]/div/main/div/div[2]/div[1][.//text()[normalize-space()='English']]//button[@data-state='unchecked']

${Français_IS_OFF}    xpath=/html/body/div[1]/div/main/div/div[2]/div[2][.//text()[normalize-space()='Français']]//button[@data-state='unchecked']
${Français_IS_ON}     xpath=/html/body/div[1]/div/main/div/div[2]/div[2][.//text()[normalize-space()='Français']]//button[@data-state='checked']

${Español_IS_OFF}    xpath=/html/body/div[1]/div/main/div/div[2]/div[3][.//text()[normalize-space()='Español']]//button[@data-state='unchecked']
${Español_IS_ON}     xpath=/html/body/div[1]/div/main/div/div[2]/div[3][.//text()[normalize-space()='Español']]//button[@data-state='checked']