*** Settings ***
Resource    ../../../resources/common/common_settings.robot
Suite Setup     Open Sign In Page
Suite Teardown  Close Browsers

*** Test Cases ***

Verify the system show validation text when data User ID is empty
    Click on User ID field
    Do not input User ID
    Click Sign In Button
    Wait for Validation Text of User ID empty

Verify the system show validation text when user input data less than 5 character in User ID
    Input User ID less than 5 characters
    Wait for Validation Text of User ID less than 5 characters

Verify the system show validation text when user input data more than 20 characters in User ID
    Input User ID more than 20 characters
    Wait for Validation Text of User ID more than 20 characters

Verify the system show validation text when user input special characters in User ID
    Input User ID contain special characters
    Wait for Validation Text of User ID contain special characters

Verify the system show validation text when user input spaces in User ID
    Click on User ID field
    Input User ID contain spaces
    Wait for Validation Text of User ID contain spaces

Verify the system show validation text when data Password is empty
    Click on Password field
    Do not input Password
    Click Sign In Button
    Wait for Validation Text of Password empty

Verify the system show validation text when user input data less than 8 characters in Password
    Input Password less than 8 characters
    Wait for Validation Text of Password less than 8 characters

Verify the system show validation text when user input spaces in Password
    Click on Password field
    Input Password contain spaces
    Wait for Validation Text of Password contain spaces

Verify the system show validation text when user input data missing number in Password
    Input Password missing number
    Wait for Validation Text of Password missing number

Verify the system show validation text when user input data missing uppercase in Password
    Input Password missing uppercase
    Wait for Validation Text of Password missing uppercase

Verify the system show validation text when user input data missing lowercase in Password
    Input Password missing lowercase
    Wait for Validation Text of Password missing lowercase

Verify the system show validation text when user input data missing special character in Password
    Input Password missing special character
    Wait for Validation Text of Password missing special character

Verify the Owner Sign In Successfully when user input correct 
    [Tags]    Success
    Input correct Owner User ID
    Input correct Owner Password
    Click Sign In Button
    Wait For Report Menu

Verify the system Sign Out Successfully when user click Sign Out button
    [Tags]    Success
    Given Click on My Account avatar
    When Click on Sign Out Button
    Then Wait for system navigate user back to Sign in screen
    Set Test Message    Sign Out Successfully