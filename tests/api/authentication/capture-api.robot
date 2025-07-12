*** Settings ***
Resource    ../../../resources/common/common_settings.robot
Library     ../../../library-python/FinalNetwork.py    WITH NAME    bikipluyenrong
Suite Setup    Basic Setup
Suite Teardown  Close PandaPay

*** Test Cases ***
Verify the Owner sign in successfully when input correct account
    ${driver}=    Get Library Instance    SeleniumLibrary

    Given user is on the sign in page
    When user enters Owner User ID
    And user enters Owner password
    And user clicks Sign In button

    bikipluyenrong.Start Network Interception    ${driver.driver}
    # Clear any existing requests
    bikipluyenrong.Clear Intercepted Requests    ${driver.driver}
    # Wait for profile request
    ${profile_request}=    bikipluyenrong.Wait For Request    ${driver.driver}    ${PROFILE_ENDPOINT}    GET    10
    bikipluyenrong.Stop Network Interception    ${driver.driver}

    
    



    
