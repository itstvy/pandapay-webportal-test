*** Settings ***
Resource    ../../resources/common/common_settings.robot
Suite Setup    Basic Setup

*** Test Cases ***
Verify the system displays Report page
    Wait Until Element Is Visible    ${REPORT_MENU}

