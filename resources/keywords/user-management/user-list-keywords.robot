*** Settings ***
Resource    ../../../resources/common/common_settings.robot

*** Keywords ***
user press on "User" in Menu
    Wait Until Element Is Visible    ${USER_MENU_BUTTON}
    Click Element    ${USER_MENU_BUTTON}

user refresh the User List page
    Wait Until Element Is Visible    ${USER_LIST_TITLE_PAGE}
    Reload Page

user enter correct User ID in Search field
    Wait Until Element Is Visible    ${SEARCH_USER_FIELD}
    Click Element    ${SEARCH_USER_FIELD}
    Input Text    ${SEARCH_USER_FIELD}    ${USER_ID_DATA}
    SeleniumLibrary.Press Keys    ${SEARCH_USER_FIELD}    ENTER
system displays data match with data entered in Search field
    Wait Until Page Contains Element    ${USER_ITEMS_CONTAINS_USER_ID}

user press on "Reset" button
    Wait Until Element Is Visible    ${RESET_BUTTON}
    Click Element    ${RESET_BUTTON}
    
system reset User list successfully
    Wait Until Element Is Visible    ${RANDOM_USERS}
    ${user_list}=    Get WebElements    ${RANDOM_USERS}
    ${count}=    Get Length    ${user_list}
    Set element to Test Message    Total User:${count}

#API
system displays correct data of User List
    ${webdriver}=    Get Selenium Driver
    Setup API Capture Environment    ${webdriver}
    When user refresh the User List page

    #Capture API
    ${user_list_request}=    Wait for API Request    ${webdriver}    ${USER_LIST_ENDPOINT}    GET    10

    #Log
    Log everything of API Request    ${user_list_request} 

    #Parse Response
    ${user_list_response}=    Set Variable    ${user_list_request['response']}
    ${parse_user_list_response}=    Evaluate    json.loads('''${user_list_response}''')    json
    ${data_of_user_list}=    Get From Dictionary    ${parse_user_list_response}    data
    ${api_count}=    Get Length    ${data_of_user_list}
    
    ${user_list}=    Create List
    FOR    ${user_items}    IN    @{data_of_user_list}
            ${user_profile}=    Get From Dictionary    ${user_items}    userprofile
            ${first_name}=    Get From Dictionary    ${user_profile}    first_name
            ${last_name}=    Get From Dictionary    ${user_profile}    last_name
            ${role}=    Get From Dictionary    ${user_profile}    role
            Append To List    ${user_list}    ${first_name}    ${last_name}    ${role}
    END

    #Set Test Message
    ${all_user_items}=    Evaluate    json.dumps(${user_list})    json
    Set element to Test Message    Total User:${api_count}    User:${all_user_items}    Response: ${parse_user_list_response}    
    bikip.Stop Network Interception    ${webdriver}   

user select any user items
    ${COUNT_USER_ITEMS}=    Get Element Count    ${USER_ITEMS}
    ${RANDOM_USER_ITEMS}=    Evaluate    random.randint(1, int(${COUNT_USER_ITEMS}))    random
    
    #Prepare
    ${webdriver}=    Get Selenium Driver
    Setup API Capture Environment    ${webdriver}
    
    Click element    xpath=//table//tbody/tr[${RANDOM_USER_ITEMS}]
    
    #Capture API
    ${user_details_request}=    Wait for API Request    ${webdriver}    ${USER_LIST_ENDPOINT}    GET    10
    
    ${user_details_response}=    Set Variable    ${user_details_request['response']}
    ${parse_user_details_response}=    Evaluate    json.loads('''${user_details_response}''')    json
    ${data_of_userdetails}=    Get From Dictionary    ${parse_user_details_response}    data
    
    
    #Set Test Message
    Set element to Test Message    User Details:${data_of_userdetails}
    bikip.Stop Network Interception    ${webdriver} 

system displays User Details screen correctly
    Wait Until Element Is Visible    ${USER_DETAILS_TITLE}
    Wait Until Element Is Visible    ${USER_INFORMATION_TITLE_FORM}