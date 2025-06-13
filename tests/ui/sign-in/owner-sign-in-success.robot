*** Settings ***
Resource    ../../../resources/common/common_settings.robot
Resource    ../../../resources/common/common_variables.robot
Resource    ../../../resources/page-objects/sign-in/sign-in-variables.robot
Resource    ../../../resources/ui/sign-in/sign-in-keywords.robot

*** Test Cases ***
Owner Sign In Success
    Open Sign In Page
    Input User ID
    sign-in-keywords.Input Password
    Click Sign In Button
    Wait For Report Menu