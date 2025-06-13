*** Settings ***
Resource    ../../../resources/common/common_settings.robot
Resource    ../../../resources/common/common_variables.robot
Resource    ../../../resources/keywords/authentication/sign-in-keywords.robot
Resource    ../../../resources/variables/authentication/sign-in-variables.robot




*** Test Cases ***
Owner Sign In API Success
    #Tạo session
    Create Session    api_session    ${DEV_API}    verify=True

    #Tạo body cho request đăng nhập
    ${body}=    Create Dictionary
    ...    user_code=${OWNER_USER_ID}
    ...    password=${OWNER_PASSWORD}
    ...    type=${TYPE_ORG_ADMIN}
    
    #Gửi POST request đến endpoint đăng nhập
    ${response}=    POST On Session
    ...    api_session
    ...    ${SIGNIN_ENDPOINT}
    ...    json=${body}
    
    #Check status code trả về là 201
    Status Should Be    201    ${response}

    #Chuyển response thành JSON để verify
    ${json}=    Set Variable    ${response.json()}

    #Verify các key có trong response
    Dictionary Should Contain Key    ${json}    success
    Dictionary Should Contain Key    ${json}    statusCode
    Dictionary Should Contain Key    ${json}    message
    Dictionary Should Contain Key    ${json}    data

    
    # Verify giá trị của các trường cơ bản
    Should Be True    ${json["success"]}
    Should Be Equal    ${json["statusCode"]}    ${201}
    Should Be Equal    ${json["message"]}    SIGN_IN_SUCCESSFULLY

    # Verify data object
    ${data}=    Set Variable    ${json["data"]}
    Dictionary Should Contain Key    ${data}    access_token
    Dictionary Should Contain Key    ${data}    refresh_token
    Dictionary Should Contain Key    ${data}    info
    
    # Verify info object
    ${info}=    Set Variable    ${data["info"]}
    Dictionary Should Contain Key    ${info}    phone_number
    Dictionary Should Contain Key    ${info}    email
    Dictionary Should Contain Key    ${info}    first_name
    Dictionary Should Contain Key    ${info}    last_name
    Dictionary Should Contain Key    ${info}    user_code


    # Verify giá trị của các trường trong info
    Should Be Equal    ${info["user_code"]}    ${OWNER_USER_ID}
    Should Be Equal    ${info["email"]}    an@yopmail.com
    Should Be Equal    ${info["first_name"]}    An
    Should Be Equal    ${info["last_name"]}    Store
    Should Be Equal    ${info["phone_number"]}    8980009989