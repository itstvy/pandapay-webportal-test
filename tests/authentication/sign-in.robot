*** Settings ***
Resource    ../../resources/common/common_settings.robot
Suite Setup     Basic Setup
Suite Teardown  Close PandaPay
Documentation    Test Sign In page with UI; Success; Unssucess; Logic; API

*** Test Cases ***
Verify the system shows validation text when user leaves User ID empty
    [Tags]    Validation
    When user clicks on User ID field
    And user leaves User ID empty
    And user clicks Sign In button
    Then user should see User ID empty validation

Verify the system shows validation text when user enters User ID with less than 5 characters
    [Tags]    Validation
    When user enters User ID with less than 5 characters
    Then user should see User ID validation for less than 5 characters

Verify the system shows validation text when user enters User ID with more than 20 characters
    [Tags]    Validation
    When user enters User ID with more than 20 characters
    Then user should see User ID validation for more than 20 characters

Verify the system shows validation text when user enters User ID with special characters
    [Tags]    Validation
    When user enters User ID with special characters
    Then user should see User ID validation for special characters

Verify the system shows validation text when user enters User ID with spaces
    [Tags]    Validation
    When user clicks on User ID field
    And user enters User ID with spaces
    Then user should see User ID validation for spaces

Verify the system shows validation text when user leaves Password empty
    [Tags]    Validation
    When user clicks on Password field
    And user leaves Password empty
    And user clicks Sign In button
    Then user should see Password empty validation

Verify the system shows validation text when user enters Password with less than 8 characters
    [Tags]    Validation
    When user enters Password with less than 8 characters
    Then user should see Password validation for less than 8 characters

Verify the system shows validation text when user enters Password with spaces
    [Tags]    Validation
    When user clicks on Password field
    And user enters Password with spaces
    Then user should see Password validation for spaces

Verify the system shows validation text when user enters Password without numbers
    [Tags]    Validation
    When user enters Password without numbers
    Then user should see Password validation for missing number

Verify the system shows validation text when user enters Password without uppercase letters
    [Tags]    Validation
    When user enters Password without uppercase letters
    Then user should see Password validation for missing uppercase

Verify the system shows validation text when user enters Password without lowercase letters
    [Tags]    Validation
    When user enters Password without lowercase letters
    Then user should see Password validation for missing lowercase

Verify the system shows validation text when user enters Password without special characters
    [Tags]    Validation
    When user enters Password without special characters
    Then user should see Password validation for missing special character

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
    Sleep    5s
    Then user should see Report menu
    
Verify the system Sign user out successfully when user click on Sign Out button
    [Tags]    Success    API
    Given user clicks on My Account avatar
    And user click on Sign Out button and system sign user out successfully
    Then user should be redirected to Sign in screen
    Sleep    5s
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
    Sleep    5s
    Then user should see Report menu





