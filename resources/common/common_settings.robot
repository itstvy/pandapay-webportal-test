*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections
Library    String
Library    BuiltIn
Library    RequestsLibrary
Library    json
Library    ../../library-python/CaptureAPI.py    WITH NAME     bikip

Resource    ../../resources/common/common_variables.robot
Resource    ../../resources/common/common_keywords.robot
Resource    ../../draft/sign-in-keywords-draft.robot
Resource    ../../resources/keywords/authentication/sign-in-keyword.robot
Resource    ../../resources/variables/authentication/sign-in-variables.robot




