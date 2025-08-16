*** Settings ***
Resource    ../../resources/common/common_settings.robot
Resource    ../../resources/keywords/myAccount/profile-keyword.robot
Suite Setup    Basic Setup
Suite Teardown    Close PandaPay

*** Test Cases ***
#Sign in first
Verify Owner Sign In Successfully when user inputs correct credentials
    [Tags]    Success    API
    [Documentation]    Owner Sign in successfully
    When user enters Owner User ID
    And user enters Owner password
    When user click on Sign In button and send Owner valid credentials
    Sleep    5s
    Then user should see Report menu

Verify the system displays Change User Information screen when user click on Profile menu button
    [Tags]    UI
    Given user clicks on My Account avatar
    And user should see a Profile menu button
    And user click on the Profile menu button
    Then the system displays the Change User Information screen

Verify the system displays validation text when user input data less than 2 characters in First Name field
    [Tags]    Validation
    Given the system displays the Change User Information screen
    And user enters data less than 2 characters in First Name field
    Then user should see First Name validation for less than 2 characters

# Verify the system displays validation text when user input data more than 50 characters in First Name field


# Verify the system displays validation text when data in Last Name field is empty

# Verify the system displays validation text when user input data less than 2 characters in Last Name field

# Verify the system displays validation text when user input data more than 50 characters in Last Name field




# Verify the system displays success message when user update profile successfully
#     [Tags]    UI    API    Success
#     [Documentation]    Update User Information Successfully
#     Given user clicks on My Account avatar
#     And user should see a Profile menu button
#     And user click on the Profile menu button
#     Then the system displays the Change User Information screen
#     When user input new User information
#     And user clicks on Submit button in User Information form and send valid information
#     Then the system must displays success message when update profile successfully

    
