*** Settings ***
Resource    ../settings/common.robot
Resource    ../settings/common-web.robot
Resource    ../settings/settings.robot
Library    ../libraries/library.py

*** Keywords ***
Go To Url
    [Arguments]  ${url}
    Open Browser  ${url}  chrome


Create contact in group
    [Arguments]    ${group_name}
    ${first_name}  lib_create_random_first_name
    ${last_name}  lib_create_random_last_name
    ${address}  lib_create_random_address
    ${date}  lib_get_current_date
    Input Text  xpath=${BASE_URL_FIRST_NAME}  ${first_name}
    Input Text  xpath=${BASE_URL_LAST_NAME}  ${last_name}
    Input Text  xpath=${BASE_URL_BIRTH_DAY}  ${date}
    Press Keys  xpath=${BASE_URL_BIRTH_DAY}    ENTER
    Input Text  xpath=${BASE_URL_ADDRESS}  ${address}
    Click Element  xpath=//select[@class='gwt-ListBox']/option[@value='${group_name}']
    Click Element  ${BASE_URL_CREATE_CONTACT_BTN}
    ${result}  lib_catenate_name_with_last_name  ${first_name}  ${last_name}
    [Return]  ${result}

Validate count of contacts
    [Arguments]    ${before}  ${after}  ${num_of_added_contacts}
    ${expected_result}  lib_sum  ${before}  ${num_of_added_contacts}
    Should Be Equal  ${after}  ${expected_result}


Get number of contacts
    ${str_number_of_contacts}  Get Text  ${BASE_URL_COUNTER}
    ${number_of_contacts}  lib_get_max_number_from_list  ${str_number_of_contacts}
    [Return]  ${number_of_contacts}


Validate that names was added to contacts list
    [Arguments]   ${name}
    Wait Until Element Is Visible  xpath=//div[@id='gwt-debug-contentPanel']//table/descendant::td[text()='${name}']


Scroll table with contacts
    FOR    ${i}    IN RANGE    15
        Execute Javascript   document.querySelector('${BASE_URL_SCROLL_CSS}').scrollTop = 10000;
        Sleep  1s
    END