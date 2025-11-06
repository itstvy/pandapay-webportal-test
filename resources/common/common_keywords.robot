*** Settings ***
Resource    ../../resources/common/common_settings.robot

Library    ../../library-python/CaptureAPI.py    WITH NAME     bikip

*** Keywords ***
#==========================================================================================#
Basic Setup
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${logging_prefs}=    Create Dictionary    performance=ALL
    Call Method    ${options}    set_capability    goog:loggingPrefs    ${logging_prefs}
    Open Browser    ${PANDAPAY_URL}    ${BROWSER}    options=${options}
    Maximize Browser Window
    # Restore Browser Session
    
Close PandaPay
    Close All Browsers
#==========================================================================================#
Input data in Element
    [Arguments]    ${element_locator}    ${data_input}
    Wait Until Element Is Visible    ${element_locator}    5s
    SeleniumLibrary.Press Keys       ${element_locator}    CTRL+A+BACKSPACE
    Input Text    ${element_locator}    ${data_input}
    
Click on Element
    [Arguments]    ${element_locator}
    Wait Until Element Is Visible    ${element_locator}
    Click Element    ${element_locator}

Clear Input field
    [Arguments]    ${locator}
    SeleniumLibrary.Press Keys       ${locator}    CTRL+A+BACKSPACE
    

Get Selenium Driver
    [Arguments]    ${library_name}=SeleniumLibrary

    ${selenium_Library}=    Get Library Instance    ${library_name}
    ${webdriver}=    Set Variable    ${selenium_Library.driver}
    RETURN    ${webdriver}

Wait for API Request
    [Arguments]    ${driver}    ${api_endpoint}    ${http-method}    ${timeout}

    bikip.Clear Persistent Storage    ${driver}
    ${request}=    bikip.Wait For Request    ${driver}    ${api_endpoint}    ${http-method}    ${timeout}
    RETURN    ${request}

#Setup API Capture Environment
Clear API Storage
    [Arguments]    ${driver}
    bikip.Clear Persistent Storage    ${driver}

Start API Capture
    [Arguments]    ${driver}
    bikip.Start Network Interception    ${driver}

Clear API Intercepted Requests
    [Arguments]    ${driver}
    bikip.Clear Intercepted Requests    ${driver}

#This is the keyword use for 3 steps above
Setup API Capture Environment
    [Arguments]    ${driver}
    Clear API Storage    ${driver}
    Start API Capture    ${driver}
    Clear API Intercepted Requests    ${driver}

Log everything of API Request
    [Arguments]    ${request}

    Log    URL: ${request['url']}
    Log    Method: ${request['method']}
    Log    StatusCode: ${request['status']}
    Log    Payload: ${request['payload']}
    Log    Response: ${request['response']}

Set Log Request to Test Message
    [Arguments]    ${request}    ${append}=True
    Set Test Message    URL: ${request['url']}
    Set Test Message    \n\nMethod: ${request['method']}    append=${append}
    Set Test Message    \n\nStatusCode: ${request['status']}    append=${append}
    Set Test Message    \n\nPayload: ${request['payload']}    append=${append}
    Set Test Message    \n\nResponse: ${request['response']}    append=${append}

Set element to Test Message
    [Arguments]    @{elements}    ${append}=True
    FOR    ${index}    ${element}    IN ENUMERATE    @{elements}
        ${is_first}=    Run Keyword And Return Status    Should Be Equal As Integers    ${index}    0
        IF    ${is_first}
            Set Test Message    ${element}
        ELSE
            Set Test Message    \n\n${element}    append=${append}
        END
    END

#================Fake Data Generate====================#
Generate Fake First Name
    ${first_name}=    First Name
    Set Suite Variable    ${GENERATED_FIRST_NAME}    ${first_name}
    RETURN    ${first_name}

Generate Fake User ID
    ${first_name}=    Set Variable    ${GENERATED_FIRST_NAME}
    ${user_name}=    Replace String Using Regexp    ${first_name}    [^A-Za-z0-9]    ''
    ${user_name}=    Convert To Lowercase    ${user_name}
    ${rand_num}=    Generate Random String    3    [NUMBERS]
    ${user_id}=    Catenate    SEPARATOR=    ${user_name}    ${rand_num}
    Set Suite Variable    ${GENERATED_USER_ID}    ${user_id}
    RETURN    ${user_id}

Generate Fake Email with Yopmail
    ${first_name}=    Set Variable    ${GENERATED_FIRST_NAME}
    ${user_name}=    Replace String Using Regexp    ${first_name}    [^A-Za-z0-9]    _
    ${user_name}=    Convert To Lowercase    ${user_name}
    ${email}=    Catenate    SEPARATOR=@    ${user_name}    yopmail.com
    RETURN    ${email}

Generate Fake Last Name
    ${last_name}=    Last Name
    RETURN    ${last_name}

# Hàm `Generate Fake US Phone Number` dùng để tạo ra một số điện thoại US giả lập và hợp lệ để test.
# 1. Random chữ số đầu tiên (`valid_first_number`) từ 2 đến 9, đảm bảo số điện thoại không bắt đầu bằng số 0 hoặc 1 (theo quy tắc US phone number thật).
# 2. Sinh tiếp 9 ký tự số ngẫu nhiên (`rest_number`) để hoàn thiện chuỗi số điện thoại tổng cộng 10 số (US tiêu chuẩn).
# 3. Nối (`Catenate`) chữ số đầu tiên và 9 số tiếp theo lại thành một chuỗi (không có ký tự phân cách).
# 4. Trả về số điện thoại đã sinh ra.
Generate Fake US Phone Number
    ${valid_first_number}=    Random Int    min=2    max=9
    ${rest_number}=    Generate Random String    9    [NUMBERS]
    ${valid_phonenumber}=    Catenate    SEPARATOR=    ${valid_first_number}    ${rest_number}
    RETURN    ${valid_phonenumber}

Generate Fake Address
    ${street_address}=    Street Address
    ${city}=    City
    ${state}=    State
    ${full_address}=    Catenate    SEPARATOR=,     ${street_address}    ${city}    ${state}
    RETURN    ${full_address}

