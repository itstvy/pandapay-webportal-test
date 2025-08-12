*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections
Library    String
Library    BuiltIn
Library    RequestsLibrary
Library    json

Resource    ../../resources/common/common_variables.robot
Resource    ../../resources/common/common_keywords.robot
Resource    ../../resources/keywords/authentication/sign-in-keywords.robot
Resource    ../../resources/keywords/authentication/sign-in-gherkin-keyword.robot
Resource    ../../resources/variables/authentication/sign-in-variables.robot




