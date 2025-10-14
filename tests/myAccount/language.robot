*** Settings ***
Resource    ../../resources/common/common_settings.robot
Suite Setup    Basic Setup

*** Test Cases ***
Verify save cookies
    Go To    ${CHANGE_LANGUAGE_URL}
    Wait Until Element Is Visible    ${CHANGE_LANGUAGE_TITLE}

