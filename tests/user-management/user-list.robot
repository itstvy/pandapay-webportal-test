*** Settings ***
Resource    ../../resources/common/common_settings.robot
Suite Setup    Basic Setup

*** Test Cases ***
Verify Owner Sign In Successfully when user inputs correct credentials
    [Tags]    Success    API
    [Documentation]    Owner Sign in successfully
    When user enters Owner User ID
    And user enters Owner password
    When user click on Sign In button and send Owner valid credentials
    Sleep    5s
    Then user should see Report menu

Verify the system displays User List page when user press on "User" in Menu
    [Tags]    Success    API
    When user press on "User" in Menu
    Then system displays correct data of User List
