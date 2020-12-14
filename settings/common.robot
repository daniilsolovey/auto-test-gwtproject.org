*** Settings ***
Resource    ../settings/settings.robot

*** Keywords ***

Common Test Setup

Common Suite Setup
    Go To Url  ${BASE_URL}

Common Suite Teardown
    Close All Browsers

Common Test Teardown
    Close Browser
    Terminate All Processes