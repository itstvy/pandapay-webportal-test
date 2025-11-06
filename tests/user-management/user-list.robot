*** Settings ***
Resource    ../../resources/common/common_settings.robot
Suite Setup    Basic Setup

*** Test Cases ***
Verify the system displays User List page when user press on "User" in Menu
    [Tags]    Success    API
    [Documentation]    User access to User List and system displays correct User list data 
    When user press on "User" in Menu
    Then system displays correct data of User List

Verify the system displays correct when user search by User ID
    [Tags]    Success    API
    [Documentation]    User search by User ID
    When user enter correct User ID in Search field
    Then system displays data match with data entered in Search field

Verify the system reset User list successful when user press on "Reset" button
    When user press on "Reset" button
    Then system reset User list successfully

Verify the system displays User Details when user select any User items in User List
    [Tags]    Success    API
    [Documentation]    User select random user and system displays correct User Details information
    When user select any user items
    Then system displays User Details screen correctly

            