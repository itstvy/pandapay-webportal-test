*** Settings ***
Resource    ../../../resources/common/common_settings.robot
Suite Setup     Basic Setup
Suite Teardown  Close PandaPay

*** Test Cases ***
Verify User ID Empty Validation
    When user clicks on User ID field
    And user leaves User ID empty
    And user clicks Sign In button
    Then user should see User ID empty validation

Verify User ID Less Than 5 Characters Validation
    When user enters User ID with less than 5 characters
    Then user should see User ID validation for less than 5 characters

Verify User ID More Than 20 Characters Validation
    When user enters User ID with more than 20 characters
    Then user should see User ID validation for more than 20 characters

Verify User ID Special Characters Validation
    When user enters User ID with special characters
    Then user should see User ID validation for special characters

Verify User ID Spaces Validation
    When user clicks on User ID field
    And user enters User ID with spaces
    Then user should see User ID validation for spaces

Verify Password Empty Validation
    When user clicks on Password field
    And user leaves Password empty
    And user clicks Sign In button
    Then user should see Password empty validation

Verify Password Less Than 8 Characters Validation
    When user enters Password with less than 8 characters
    Then user should see Password validation for less than 8 characters

Verify Password Spaces Validation
    When user clicks on Password field
    And user enters Password with spaces
    Then user should see Password validation for spaces

Verify Password Missing Number Validation
    When user enters Password without numbers
    Then user should see Password validation for missing number

Verify Password Missing Uppercase Validation
    When user enters Password without uppercase letters
    Then user should see Password validation for missing uppercase

Verify Password Missing Lowercase Validation
    When user enters Password without lowercase letters
    Then user should see Password validation for missing lowercase

Verify Password Missing Special Character Validation
    When user enters Password without special characters
    Then user should see Password validation for missing special character

Verify Owner Sign In Successfully
    [Tags]    Success
    When user enters Owner User ID
    And user enters Owner password
    And user click on Sign In button and send request to server
    Sleep    5s
    Then user should see Report menu

Verify Sign Out Successfully
    [Tags]    Success
    When user clicks on My Account avatar
    And user clicks on Sign Out button
    Then user should be redirected to Sign in screen
