*** Settings ***
Resource    ../../../resources/common/common_settings.robot

*** Keywords ***
#================Input Data====================#

Input Fake Data in User Creation Form
    [Arguments]    ${userID_field}
    ...    ${firstName_field}
    ...    ${lastName_field}
    ...    ${email_field}
    ...    ${phoneNumber_field}
    ...    ${address_field}
    ${firstName_data}=    Generate Fake First Name
    ${userID_data}=    Generate Fake User ID
    ${lastName_data}=    Generate Fake Last Name
    ${email_data}=    Generate Fake Email with Yopmail
    ${phoneNumber_data}=    Generate Fake US Phone Number
    ${address_data}=    Generate Fake Address
    Input data in Element    ${firstName_field}    ${firstName_data}
    Input data in Element    ${userID_field}    ${userID_data}
    Input data in Element    ${lastName_field}   ${lastName_data}
    Input data in Element    ${email_field}    ${email_data}
    Input data in Element    ${phoneNumber_field}    ${phoneNumber_data}
    Input data in Element    ${address_field}    ${address_data}

#================Input Valid Data====================#

user is on User List page
    Wait Until Element Is Visible    ${USER_MENU_BUTTON}
    Click Element    ${USER_MENU_BUTTON}

user press on "Create New User" button
    Wait Until Element Is Visible    ${ADD_NEW_USER_BUTTON}
    Click Element    ${ADD_NEW_USER_BUTTON}

system displays correct UI Create User screen
    Wait Until Element Is Visible    ${CREATE_NEW_USER_TITLE_PAGE}

user input valid data in all required fields
    Input Fake Data in User Creation Form    
    ...    ${CREATE_USER_ID_FIELD}    
    ...    ${CREATE_USER_FIRST_NAME_FIELD} 
    ...    ${CREATE_USER_LAST_NAME_FIELD}
    ...    ${CREATE_USER_EMAIL_FIELD}  
    ...    ${CREATE_USER_PHONE_NUMBER_FIELD}  
    ...    ${CREATE_USER_ADDRESS_FIELD}
    Input data in Element    ${CREATE_USER_DATE_OF_BIRTH_FIELD}    ${DATE_OF_BIRTH_DATA}
    User select Gender in User Creation form
    User select Role in User Creation form
    Input data in Element    ${CREATE_USER_PASSWORD_FIELD}    ${VALID_NEW_PASSWORD}
    Input data in Element    ${CREATE_USER_CONFIRM_PASSWORD_FIELD}    ${VALID_CONFIRM_NEW_PASSWORD}

User select Gender in User Creation form
    Click on Element    ${GENDER_FEMALE_OPTION}
User select Role in User Creation form
    Click on Element    ${USER_ROLE_STAFF}
user clicks on Submit form button in User Creation form
    Click on Element    ${CREATE_USER_SUBMIT_FORM_BUTTON}

#=====================Input Invalid Data======================#
#=====================Displays Validation Text=========================#


#=====================API Step========================#
system proceed to create new user successfully
    ${webdriver}=    Get Selenium Driver
    Setup API Capture Environment    ${webdriver}
    When user clicks on Submit form button in User Creation form
    ${createUser_request}=    Wait for API Request    ${webdriver}    ${USER_LIST_ENDPOINT}    POST    10
    Set element to Test Message    ${createUser_request}
    bikip.Stop Network Interception    ${webdriver}
    

    