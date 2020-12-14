*** Settings ***
Resource    ../settings/common.robot
Resource    ../settings/common-web.robot
Resource    ../settings/settings.robot
Library    ../libraries/library.py

Suite Setup  Common Suite Setup
Suite Teardown  Common Suite Teardown
# Test Setup  Common Test Setup
Test Teardown  Common Test Teardown

# Test Timeout    2 minutes
*** Variables ***

*** Test Cases ***
Contacts are added to the list
    Go To  ${BASE_URL}
    Wait Until Element Is Visible  ${BASE_URL_COUNTER}
    ${num_of_contacts_before}  Get number of contacts
    # adding 5 contacts to groups
    ${name_1}  Create contact in group  Coworkers
    ${name_2}  Create contact in group  Friends
    ${name_3}  Create contact in group  Family
    ${name_4}  Create contact in group  Businesses
    ${name_5}  Create contact in group  Contacts
    ${num_of_contacts_after}  Get number of contacts
    # validate that contacts was added
    Validate count of contacts  ${num_of_contacts_before}  ${num_of_contacts_after}  5
    # scroll list with contacts
    Scroll table with contacts
    # validate that names was added to contacts list
    Validate that names was added to contacts list  ${name_1}
    Validate that names was added to contacts list  ${name_2}
    Validate that names was added to contacts list  ${name_3}
    Validate that names was added to contacts list  ${name_4}
    Validate that names was added to contacts list  ${name_5}