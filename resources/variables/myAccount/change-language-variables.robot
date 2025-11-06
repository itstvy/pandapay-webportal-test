*** Settings ***
Resource    ../../../resources/common/common_settings.robot

*** Variables ***
#Locators of CHANGE LANGUAGE elements
${CHANGE_LANGUAGE_TITLE}    xpath=//h2[text()='Language Change']
${ENGLISH_IS_OFF}    xpath=//div[div/span[contains(text(),'English')]]//button[@data-state='checked']
${ENGLISH_IS_ON}     xpath=//div[div/span[contains(text(),'English')]]//button[@data-state='unchecked']

${Français_IS_OFF}    xpath=//div[div/span[contains(text(),'Français')]]//button[@data-state='unchecked']
${Français_IS_ON}     xpath=//div[div/span[contains(text(),'Français')]]//button[@data-state='checked']

${Español_IS_OFF}    xpath=//div[div/span[contains(text(),'Español')]]//button[@data-state='unchecked']
${Español_IS_ON}     xpath=//div[div/span[contains(text(),'Español')]]//button[@data-state='checked']