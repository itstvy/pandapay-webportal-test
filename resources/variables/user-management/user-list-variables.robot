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
${MEATBALL_MENU_BUTTON}    xpath=//button[@id='radix-:rn:']//button[@class='inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&_svg]:pointer-events-none [&_svg]:size-4 [&_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 w-10 border-none]

#User Details
${USER_DETAILS_TITLE}    xpath=//p[contains(text(),"User Details")]
${USER_INFORMATION_TITLE_FORM}    xpath=//p[contains(text(),"User Information")]

