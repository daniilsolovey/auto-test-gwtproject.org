*** Settings ***
Library    Process
Library    OperatingSystem
Library    String
Library    SeleniumLibrary
Library    Collections

*** Variables ***

${TIME_OUT}  30 sec
${KEYWORDS_TIME_OUT}  10 sec
${BASE_URL}  http://samples.gwtproject.org/samples/Showcase/Showcase.html#!CwCellList

# site forms
${BASE_URL_FIRST_NAME}  //table/tbody/tr[2]/td[2]/input[@class='gwt-TextBox']
${BASE_URL_LAST_NAME}  //table/tbody/tr[3]/td[2]/input[@class='gwt-TextBox']
${BASE_URL_BIRTH_DAY}  //table/tbody/tr[5]/td[2]/input[@class='gwt-DateBox']
${BASE_URL_ADDRESS}  //table/tbody/tr[6]/td[2]/textarea[@class='gwt-TextArea']
${BASE_URL_CREATE_CONTACT_BTN}  //button[@class='gwt-Button' and contains(text(),'Create Contact')]
${BASE_URL_CATEGORY}  //select[@class='gwt-ListBox']
${BASE_URL_COUNTER}  //div[@class='gwt-HTML' and contains(text(),':')]
${BASE_URL_SCROLL_CSS}  .GNHGC04CJJ