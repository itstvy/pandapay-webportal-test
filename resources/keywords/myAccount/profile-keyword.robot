*** Settings ***
Resource    ../../../resources/common/common_settings.robot

*** Keywords ***
user click on the Profile menu button
    Click Element    ${PROFILE_MENU_BUTTON}
user should see a Profile menu button
    Wait Until Element Is Visible    ${PROFILE_MENU_BUTTON}

the system displays the Change User Information screen
    Sleep    5s
    Wait Until Element Is Visible     ${CHANGE_USER_INFORMATION_TITLE} 
    Wait Until Element Is Visible    ${PROFILE_FIRST_NAME_FIELD}
    Wait Until Element Is Visible    ${PROFILE_LAST_NAME_FIELD}
    Wait Until Element Is Visible    ${PROFILE_ADDRESS_FIELD}
    Wait Until Element Is Visible    ${SUBMIT_PROFILE_BUTTON_1}
    Wait Until Element Is Visible    ${SUBMIT_PROFILE_BUTTON_2}

user input new User information
    Clear Element Text    ${PROFILE_FIRST_NAME_FIELD}
    Input Text    ${PROFILE_FIRST_NAME_FIELD}    ${NEW_FIRST_NAME}

    Clear Element Text    ${PROFILE_LAST_NAME_FIELD}
    Input Text    ${PROFILE_LAST_NAME_FIELD}    ${NEW_LAST_NAME}

    Clear Element Text    ${PROFILE_ADDRESS_FIELD}
    Input Text    ${PROFILE_ADDRESS_FIELD}    ${NEW_ADRESS}

user enters data less than 2 characters in First Name field
    Clear Element Text    ${PROFILE_FIRST_NAME_FIELD}
    Input Text    ${PROFILE_FIRST_NAME_FIELD}    ${LESS_THAN_2_CHARACTERS}

user should see First Name validation for less than 2 characters
    Element Should Be Visible   ${FIRST_NAME_LESS_THAN_2_CHARACTERS}

user clicks on Submit button in User Information form
    Click Element    ${SUBMIT_PROFILE_BUTTON_2}

user clicks on Submit button in User Information form and send valid information
    ${webdriver}=    Get Selenium Driver
    Setup API Capture Environment    ${webdriver}
    When user clicks on Submit button in User Information form

    #Capture API
    ${update_profile_request}=    Wait for API Request    ${webdriver}    ${PROFILE_ENDPOINT}    PUT   10

    #Log Request
    Log everything of API Request    ${update_profile_request}
    Should Be Equal As Strings    ${update_profile_request['status']}    ${202_Accepted}

    #Parse Payload
    ${profile_payload}=    Set Variable    ${update_profile_request['payload']}
    ${parse_profile_payload}=    Evaluate    json.loads('''${profile_payload}''')    json
    Log    Update Profile Payload:${parse_profile_payload}
    Should Be Equal    ${parse_profile_payload['first_name']}    ${NEW_FIRST_NAME}

    #Parse Response
    ${profile_response}=    Set Variable    ${update_profile_request['response']}
    ${parse_profile_response}=    Evaluate    json.loads('''${profile_response}''')
    Log    Response Message:${parse_profile_response['message']}
    Should Be Equal As Strings    ${parse_profile_response['message']}    Updated profile successfully
    
    #Set Test Message
    Set Test Message    URL: ${update_profile_request['url']}
    Set Test Message    \n\nStatusCode: ${update_profile_request['status']}    append=True
    Set Test Message    \n\nPayload: ${update_profile_request['payload']}    append=True
    Set Test Message    \n\nResponse Message:${parse_profile_response['message']}    append=True
    Set Test Message    \n\nResponse: ${update_profile_request['response']}    append=True

the system must displays success message when update profile successfully
    Wait Until Element Is Visible    ${UPDATE_PROFILE_SUCCESS}
    
