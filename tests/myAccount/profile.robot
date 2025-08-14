*** Settings ***
Resource    ../../resources/common/common_settings.robot
Resource    ../../resources/keywords/myAccount/profile-keyword.robot
Suite Setup    Basic Setup
Suite Teardown    Close PandaPay

*** Test Cases ***
#Sign in first
Verify Owner Sign In Successfully when user inputs correct credentials
    [Tags]    Success    API
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
    
