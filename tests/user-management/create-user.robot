*** Settings ***
Resource    ../../resources/common/common_settings.robot
Suite Setup    Basic Setup

*** Test Cases ***
Verify the system displays Create User screen when user press on "Add new" button
    [Tags]    UI
    Given user is on User List page
    When user press on "Create New User" button
    Then system displays correct UI Create User screen

Verify the system create user successfully when user input valid data in all required fields
    [Tags]    UI    Success
    Given system displays correct UI Create User screen
    When user input valid data in all required fields
    And user clicks on Submit form button in User Creation form
    Then system proceed to create new user successfully