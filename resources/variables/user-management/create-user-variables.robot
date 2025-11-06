*** Settings ***
Resource    ../../../resources/common/common_settings.robot

*** Variables ***
#=======================Data=======================#
${DATE_OF_BIRTH_DATA}    12/20/2000
${ORGANIZATION_NAME}    10store    

#=======================Locator of Elements==================================#
${ADD_NEW_USER_BUTTON}    xpath=//button[contains(text(),"Add New")]
${CREATE_NEW_USER_TITLE_PAGE}    xpath=//h2[contains(text(),"Create a new user")]

${UPLOAD_AVATAR_BUTTON}                                  xpath=//p[contains(text(),"Upload Avatar")]
${CREATE_USER_ID_FIELD}                                  xpath=//input[@placeholder="Enter user id"]
${CREATE_USER_FIRST_NAME_FIELD}                          xpath=//input[@placeholder="Enter first name"]
${CREATE_USER_LAST_NAME_FIELD}                           xpath=//input[@placeholder="Enter last name"]
${CREATE_USER_EMAIL_FIELD}                               xpath=//input[@placeholder="Enter Email"]
${CREATE_USER_PHONE_NUMBER_FIELD}                        xpath=//input[@placeholder="Enter phone number"]
${CREATE_USER_DATE_OF_BIRTH_FIELD}                       xpath=//input[@placeholder="Enter date of birth"]

${GENDER_MALE_OPTION}                                    xpath=//select/option[@value="MALE"]
${GENDER_FEMALE_OPTION}                                  xpath=//select/option[@value="FEMALE"]
${GENDER_OTHER_OPTION}                                   xpath=//select/option[@value="OPTION"]

${CREATE_USER_ADDRESS_FIELD}                             xpath=//input[@placeholder="Enter address"]
${CREATE_USER_SELECT_USER_ROLE}                          xpath=//button/span[contains(text(),"Select user role")]
${USER_ROLE_STAFF}                                       xpath=//select/option[contains(text(),"Staff")]
${USER_ROLE_OWNER}                                       xpath=//select/option[contains(text(),"Owner")]

${CREATE_USER_PASSWORD_FIELD}                            xpath=//input[@placeholder="Enter password"]
${CREATE_USER_CONFIRM_PASSWORD_FIELD}                    xpath=//input[@placeholder="Enter confirm password"]
${CREATE_USER_PASSWORD_MANUALLY_CHECKED}                 xpath=//div/button[@value="manually" and @data-state="checked"]

${CREATE_USER_SELECT_ORGANIZATION_BUTTON}                xpath=//button/p[contains(text(),"Select Organization")]
${CREATE_USER_SELECT_ORGANIZATION_MODAL_TITLE}           xpath=//div/div/p[contains(text(),"Select Owner")]
${CREATE_USER_SELECT_ORGANIZATION_MODAL_SEARCH_FIELD}    xpath=//input[@placeholder="Search by User ID, User Name, Email, Phone Number"]
${CREATE_USER_ORGANIZATION_BUTTON}                       xpath=//div/button/div/p[contains(text(),"${ORGANIZATION_NAME}")]
${CREATE_USER_SELECT_ORGANIZATION_PAGINATION_PAGE}       xpath=//li/a[contains(text(),"2")]

${CREATE_USER_SUBMIT_FORM_BUTTON}                        xpath=//form/button[@type="submit" and contains(text(),"Submit")]

#==========================Validation Text===================================#
#USER ID
${VALIDATION_TEXT_USERID_LESS_THAN_5_CHARACTERS}    xpath=//p[text()='User ID must be at least 8 characters.']
# ${VALIDATION_TEXT_USERID_MORE_THAN_20_CHARACTERS}    xpath=//p[text()='User ID must be at least 8 characters.']
${VALIDATION_TEXT_USERID_EMPTY}    xpath=//p[text()='User ID is required.']
${VALIDATION_TEXT_USERID_CONTAIN_SPACES}    xpath=//p[text()='User ID cannot contain spaces or special characters.']
${VALIDATION_TEXT_USERID_CONTAIN_SPECIAL_CHARACTERS}    xpath=//p[text()='User ID cannot contain spaces or special characters.']

#FIRST NAME
${VALIDATION_TEXT_FIRSTNAME_LESS_THAN_2_CHARACTERS}    xpath=//p[text()='First name must be at least 2 characters.']
${VALIDATION_TEXT_FIRSTNAME_MORE_THAN_50_CHARACTERS}    xpath=//p[text()='First name must be at most 50 characters.']
${VALIDATION_TEXT_FIRSTNAME_EMPTY}    xpath=//p[text()='First name is required.']