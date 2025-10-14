*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections
Library    String
Library    BuiltIn
Library    RequestsLibrary
Library    JSONLibrary
Library    ../../library-python/CaptureAPI.py    WITH NAME     bikip

#Keyword
Resource    ../../resources/common/common_keywords.robot
Resource    ../../resources/common/browser_keywords.robot
Resource    ../../resources/keywords/authentication/sign-in-keyword.robot
Resource    ../../resources/keywords/myAccount/profile-keyword.robot
Resource    ../../resources/keywords/myAccount/change-language-keyword.robot
Resource    ../../resources/keywords/myAccount/change-password-keyword.robot
Resource    ../../resources/keywords/user-management/user-list-keywords.robot

#Variable
Resource    ../../resources/common/common_variables.robot
Resource    ../../resources/variables/authentication/sign-in-variables.robot
Resource    ../../resources/variables/myAccount/change-language-variables.robot
Resource    ../../resources/variables/myAccount/change-password-variables.robot
Resource    ../../resources/variables/myAccount/profile-variables.robot
Resource    ../../resources/variables/user-management/user-list-variables.robot

#Draft
Resource    ../../draft/sign-in-keywords-draft.robot
