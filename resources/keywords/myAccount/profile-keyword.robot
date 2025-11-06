*** Settings ***
Resource    ../../../resources/common/common_settings.robot

*** Keywords ***

when user click on Profile menu button
    [Tags]    UI
    Login and Save Cookies
    Given user clicks on My Account avatar
    And user should see a Profile menu button
    And user click on the Profile menu button
    Then the system displays the Change User Information screen
#UI
user click on the Profile menu button
    Click on Element    ${PROFILE_MENU_BUTTON}
user should see a Profile menu button
    Wait Until Element Is Visible    ${PROFILE_MENU_BUTTON}
user clicks on Submit button in User Information form
    Click on Element    ${SUBMIT_FORM_PROFILE_BUTTON}
the system displays the Change User Information screen
    Wait Until Element Is Visible     ${CHANGE_USER_INFORMATION_TITLE} 

#Success 
user input new User information
    Clear Element Text    ${PROFILE_FIRST_NAME_FIELD}
    Input data in Element    ${PROFILE_FIRST_NAME_FIELD}    ${NEW_FIRST_NAME}

    Clear Element Text    ${PROFILE_LAST_NAME_FIELD}
    Input data in Element    ${PROFILE_LAST_NAME_FIELD}    ${NEW_LAST_NAME}

    Clear Element Text    ${PROFILE_ADDRESS_FIELD}
    Input data in Element    ${PROFILE_ADDRESS_FIELD}    ${NEW_ADRESS}

#First Name Input keywords
user clicks on First Name field
    Click on Element    ${PROFILE_FIRST_NAME_FIELD}
user leaves First Name field empty
    Clear Input field    ${PROFILE_FIRST_NAME_FIELD}
user enters data less than 2 characters in First Name field
    Input data in Element    ${PROFILE_FIRST_NAME_FIELD}    ${LESS_THAN_2_CHARACTERS}
user enters data more than 50 characters in First Name field
    Input data in Element    ${PROFILE_FIRST_NAME_FIELD}    ${MORE_THAN_50_CHARACTERS}

#Last Name Input keywords
user clicks on Last Name field
    Click on Element    ${PROFILE_LAST_NAME_FIELD}
user leaves Last Name field empty
    Clear Input field    ${PROFILE_LAST_NAME_FIELD}
user enters data less than 2 characters in Last Name field
    Input data in Element    ${PROFILE_LAST_NAME_FIELD}    ${LESS_THAN_2_CHARACTERS}
user enters data more than 50 characters in Last Name field
    Input data in Element    ${PROFILE_LAST_NAME_FIELD}    ${MORE_THAN_50_CHARACTERS}

#Address Input Keywords
user clicks on Address field
    Click on Element    ${PROFILE_ADDRESS_FIELD}
user enters data less than 5 characters in Address field
    Input data in Element    ${PROFILE_ADDRESS_FIELD}    ${LESS_THAN_5_CHARACTERS}
user enters data more than 100 characters in Address field
    Input data in Element    ${PROFILE_ADDRESS_FIELD}    ${MORE_THAN_100_CHARACTERS}

# Validation Message Verification Keywords
#First Name field
system should displays validation text if data in First Name is empty
    Wait Until Element Is Visible    ${VALIDATION_FIRST_NAME_IS_REQUIRED}    5s

system should displays validation text if the First Name field has fewer than 2 characters
    Wait Until Element Is Visible    ${VALIDATION_FIRST_NAME_LESS_THAN_2_CHARACTERS}    5s

system should displays validation text if the First Name field has more than 50 characters
    Wait Until Element Is Visible    ${VALIDATION_FIRST_NAME_MORE_THAN_50_CHARACTERS}    5s

#Last Name field
system should displays validation text if data in Last Name is empty
    Wait Until Element Is Visible    ${VALIDATION_LAST_NAME_IS_REQUIRED}    5s

system should displays validation text if the Last Name field has fewer than 2 characters
    Wait Until Element Is Visible    ${VALIDATION_LAST_NAME_LESS_THAN_2_CHARACTERS}    5s

system should displays validation text if the Last Name field has more than 50 characters
    Wait Until Element Is Visible    ${VALIDATION_LAST_NAME_MORE_THAN_50_CHARACTERS}    5s

#Address field
system should displays validation text if the Address field has fewer than 5 characters
    Wait Until Element Is Visible    ${VALIDATION_ADDRESS_LESS_THAN_5_CHARACTERS}    5s
system should displays validation text if the Address field has more than 100 characters
    Wait Until Element Is Visible    ${VALIDATION_ADDRESS_MORE_THAN_100_CHARACTERS}    5s

#Message
the system must displays success message when update profile successfully
    Wait Until Element Is Visible    ${UPDATE_PROFILE_SUCCESS}    5s
    
#API
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
    Set Test Message    \n\nResponse Message:${parse_profile_response['message']}    append=True
    #Set Test Message
    Set Log Request to Test Message    ${update_profile_request}

    
