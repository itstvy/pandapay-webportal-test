*** Settings ***
Resource    ../../resources/common/common_settings.robot
Suite Setup     Basic Setup
Suite Teardown  Close PandaPay
Documentation    Test Sign In page with UI; Success; Unssucess; Logic; API

*** Test Cases ***

Verify the Owner Sign In Unsuccessfully when user inputs incorrect credentials
    [Tags]    Unsuccess    API
    When user enters Owner User ID
    And user enters incorrect Owner Password
    And user click on Sign in button and send Owner Incorrect credentials
    Then user should see an Incorrect Account error message

Verify the Owner Sign In Unsuccessfully when user inputs Deactivated Owner credentials
    [Tags]    Unsuccess    API
    When user enters Deactivated User ID
    And user enters Deactivated Password
    And user click on Sign in button and send Owner Deactivated credentials
    Then user should see a Deactivated Account error message

Verify the Owner Sign In Unsuccessfully when Owner tries to sign in with Admin role
    [Tags]    Unsuccess    API
    When user enters Owner User ID
    And user enters Owner password
    And user ticks the Admin checkbox
    And user click on Sign In button and send Owner valid credentials in Admin role
    Then user should see an Incorrect Account error message

Verify the Owner Sign In Successfully when user inputs correct credentials
    [Tags]    Success    API
    When user enters Owner User ID
    And user enters Owner password
    And user unticks the Admin checkbox
    When user click on Sign In button and send Owner valid credentials
    Then user should see Report menu
    
Verify the system Sign user out successfully when user click on Sign Out button
    [Tags]    Success    API
    Given user clicks on My Account avatar
    And user click on Sign Out button and system sign user out successfully
    Then user should be redirected to Sign in screen
Verify that Admin sign-in fails when the Admin checkbox is not selected
    [Tags]    Unsuccess    API
    When user enters Admin User ID
    And user enters Admin password
    And user click on Sign In button and Send Admin invalid credentials in Admin role
    Then user should see an Incorrect Account error message

Verify the Admin Sign In Successfully when user inputs correct credentials
    [Tags]    Success    API
    When user enters Admin User ID
    And user enters Admin password
    And user ticks the Admin checkbox
    When user click on Sign In button and send Admin valid credentials
    Then user should see Report menu









    






