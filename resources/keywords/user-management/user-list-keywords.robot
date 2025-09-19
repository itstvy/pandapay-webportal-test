*** Settings ***
Resource    ../../../resources/common/common_settings.robot

*** Keywords ***
user press on "User" in Menu
    Wait Until Element Is Visible    ${USER_MENU_BUTTON}
    Click Element    ${USER_MENU_BUTTON}

user refresh the User List page
    Wait Until Element Is Visible    ${USER_LIST_TITLE_PAGE}
    Reload Page

system displays correct data of User List
    ${webdriver}=    Get Selenium Driver
    Setup API Capture Environment    ${webdriver}
    When user refresh the User List page

    #Capture API
    ${user_list_request}=    Wait for API Request    ${webdriver}    ${USER_LIST_ENDPOINT}    GET    10

    #Log
    Log everything of API Request    ${user_list_request} 

    #Set Test Message
    Set Log Request to Test Message    ${user_list_request}
    bikip.Start Network Interception    ${webdriver}   
