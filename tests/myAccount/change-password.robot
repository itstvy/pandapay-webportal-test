*** Settings ***
Resource    ../../resources/common/common_settings.robot
Suite Setup    Basic Setup
Suite Teardown    Close PandaPay

*** Test Cases ***
#Sign in first
Verify Owner Sign In Successfully when user inputs correct credentials
    [Tags]    Success    API
    [Documentation]    Owner Sign in successfully
    When user enters Owner User ID
    And user enters Owner password
    When user click on Sign In button and send Owner valid credentials
    Sleep    5s
    Then user should see Report menu

Verify the system displays Change Password screen when user click on Change Password menu button
    [Tags]    UI
    Given user clicks on My Account avatar
    And user clicks on the Change Password menu button
    Then system displays Change Password screen

Verify the system show validation text when user leaves Current Password field empty
    [Tags]    Validation
    When user leaves Current Password, New Password, Confirm New Password fields empty
    Then system displays validation texts when data in Current Password, New Password, Confirm New Password fields are empty

Verify the system show validation text when user input data in Current Password, New Password field less than 8 characters
    When user enters data less than 8 characters in Current Password, New Password, Confirm New Password fields
    Then system displays validation text when Current Password, New Password fields have fewer than 8 characters

Verify the system displays validation text when user enters data missing Uppercase in Current Password, New Password fields
    When user enters data missing Uppercase in Current Password, New Password fields
    Then system displays validation text when data in Current Password, New Password fields are missing uppercase

Verify the system displays validation text when user enters data missing Lowercase in Current Password, New Password fields
    When user enters data missing Lowercase in Current Password, New Password fields
    Then system displays validation text when data in Current Password, New Password fields are missing lowercase

Verify the system displays validation text when user enters data missing Number in Current Password, New Password fields
    When user enters data missing Number in Current Password, New Password fields
    Then system displays validation text when data in Current Password, New Password fields are missing number

Verify the system displays validation text when user enters data missing Special Character in Current Password, New Password fields
    When user enters data missing Special Character in Current Password, New Password fields
    Then system displays validation text when data in Current Password, New Password fields are missing special characters

Verify the system displays validation text when user enters data in Confirm New Password field NOT MATCH with New Password field
    When user enters data in Confirm New Password field NOT MATCH with New Password field
    Then system displays validation text when Confirm New Password NOT MATCH with New Password

Verify the system changes password successfully when user inputs correct credentials
    [Tags]    Success    API
    [Documentation]    Change password successfully
    Given user is on Change Password screen
    When user enters correct current password in Current Password field
    And user enters valid data in New Password field
    And user enters valid data in Confirm New Password field
    And user press on Submit form button
    Then system displays success message