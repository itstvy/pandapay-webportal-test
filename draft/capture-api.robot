*** Settings ***
Resource    ../resources/common/common_settings.robot
Suite Setup    Basic Setup
Suite Teardown  Close PandaPay

*** Test Cases ***
Verify the Owner Sign In Successfully when user inputs correct credentials
    [Tags]    Success    API
    When user enters Owner User ID
    And user enters Owner password
    When user click on Sign In button and send Owner valid credentials
    Sleep    5s
    Then user should see Report menu
Verify the system Sign user out successfully when user click on Sign Out button
    [Tags]    Success    API
    Given user clicks on My Account avatar
    And user click on Sign Out button and system sign user out successfully
    Then user should be redirected to Sign in screen
    
Verify the Admin Sign In Successfully when user inputs correct credentials
    [Tags]    Success    API
    When user enters Admin User ID
    And user enters Admin password
    And user ticks the Admin checkbox
    When user click on Sign In button and send Admin valid credentials
    Sleep    5s
    Then user should see Report menu




    
