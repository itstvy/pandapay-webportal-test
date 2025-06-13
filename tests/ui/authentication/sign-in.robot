*** Settings ***
Resource    ../../../resources/common/common_settings.robot
Resource    ../../../resources/common/common_variables.robot
Resource    ../../../resources/keywords/authentication/sign-in-keywords.robot
Resource    ../../../resources/common/common_keywords.robot
Suite Setup     Open PandaPay
Suite Teardown  Close PandaPay

*** Test Cases ***
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
    Input User ID contain spaces
    Wait for Validation Text of User ID contain spaces

Verify the system show validation text when data User ID is empty
    Do not input User ID
    Wait for Validation Text of User ID empty

Verify the system show validation text when user input data less than 8 characters in Password
    Input Password less than 8 characters
    Wait for Validation Text of Password less than 8 characters

Verify the system show validation text when user input spaces in Password
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


Verify the Owner Sign In Successfully when user input correct account
    Input correct Owner User ID
    sign-in-keywords.Input correct Owner Password
    Click Sign In Button
    Wait For Report Menu

