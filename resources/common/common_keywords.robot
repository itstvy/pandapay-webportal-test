*** Settings ***
Resource    ../../resources/common/common_settings.robot
Resource    ../../resources/common/common_variables.robot

*** Keywords ***
Open PandaPay 
    Open Browser    ${DEV_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout    ${TIMEOUT}

Close PandaPay
    Close All Browsers