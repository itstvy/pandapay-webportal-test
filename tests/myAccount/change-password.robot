*** Settings ***
Resource    ../../resources/common/common_settings.robot
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

Verify the system displays Change Password screen when user click on Change Password menu button
    [Tags]    UI
    Given user clicks on My Account avatar
    And user clicks on the Change Password menu button
    Then system displays Change Password screen

# Verify the system changes password successfully when user inputs correct credentials
#     [Tags]    Success    API
#     [Documentation]    Change password successfully
#     Given user is on Change Password screen
#     When user enters correct current password in Current Password field
#     And user enters valid data in New Password field
#     And user enters valid data in Confirm Password field
#     And user press on Submit form button
#     Then system displays success message