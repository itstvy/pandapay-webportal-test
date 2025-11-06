*** Settings ***
Resource    ../../../resources/common/common_settings.robot

*** Variables ***
#User List
${USER_LIST_TITLE_PAGE}    xpath=//h2[contains(text(),"User List")]
${USER_ITEMS}    xpath=//table//tbody/tr
${RANDOM_USERS}    xpath=//td/span[contains(text(),"-")]

${SEARCH_USER_FIELD}    xpath=//input[@placeholder='Search by User ID, User Name, Email, Phone Number...']
${USER_ID_DATA}    alexstaff
${USER_ITEMS_CONTAINS_USER_ID}    //span[contains(text(),"${USER_ID_DATA}")]

${RESET_BUTTON}    xpath=//p[contains(text(),"Reset")]
${STATUS_BUTTON}    xpath=//button[contains(text(),"Status")]
${ACTIVE_BUTTON_UNCHECKED}    xpath=//div[contains(text(),"Active")]/button[contains(@data-state,"unchecked")]
${ACTIVE_BUTTON_CHECKED}    xpath=//div[contains(text(),"Active")]/button[contains(@data-state,"checked")]
${DEACTIVATE_BUTTON_UNCHECKED}    xpath=//div[contains(text(),"Deactivated")]/button[contains(@data-state,"unchecked")]
${DEACTIVATE_BUTTON_CHECKED}    xpath=//div[contains(text(),"Deactivated")]/button[contains(@data-state,"checked")]
${STAFF_BUTTON_UNCHECKED}    xpath=//div[contains(text(),"Staff")]/button[contains(@data-state,"unchecked")]
${STAFF_BUTTON_CHECKED}    xpath=//div[contains(text(),"Staff")]/button[contains(@data-state,"checked")]
${MEATBALL_BUTTON}    xpath=//div/button/button/svg

#User Details
${USER_DETAILS_TITLE}    xpath=//p[contains(text(),"User Details")]
${USER_INFORMATION_TITLE_FORM}    xpath=//p[contains(text(),"User Information")]

