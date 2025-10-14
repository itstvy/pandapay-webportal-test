*** Settings ***
Resource    ../../resources/common/common_settings.robot

*** Variables ***
${SESSION}    .session

*** Keywords ***
Login and Save Cookies
    ${webdriver}=    Get Selenium Driver
    Setup API Capture Environment    ${webdriver}
    When user enters Owner User ID
    And user enters Owner password
    And user clicks Sign In button
    #Capture API
    ${signin_request}=    Wait for API Request    ${webdriver}    ${SIGNIN_ENDPOINT}    POST    10
    ${cookies}=    Call Method    ${webdriver}    get_cookies
    ${cookies_json}=    Evaluate    json.dumps(${cookies})    modules=json
    Create File    ${SESSION}/cookies.json    ${cookies_json}    encoding=utf-8


Restore Browser Session
    ${cookies_file}=    Set Variable    ${SESSION}/cookies.json
    ${cookies_exist}=    Run Keyword And Return Status    File Should Exist    ${cookies_file}
    IF    ${cookies_exist}
        ${webdriver}=    Get Selenium Driver
        ${cookies_json}=    Get File    ${cookies_file}
        ${cookies}=    Evaluate    json.loads('''${cookies_json}''')    modules=json
        FOR    ${cookie}    IN    @{cookies}
            Call Method    ${webdriver}    add_cookie    ${cookie}
        END
    END
    Go To    ${PANDAPAY_URL}
