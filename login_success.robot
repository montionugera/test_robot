*** Settings ***
Library			Selenium2Library
Test Setup   	Open the login page
Test Teardown	Close Browser
Resource        resources/login.robot

*** Variables ***
${LOGIN PAGE}    http://localhost:7272/html/
${WELCOME PAGE}    ${LOGIN PAGE}welcome.html
*** Testcases ***

test case : login success 1

    [Documentation]     xxxxx
    ...                 yyyy
    ...                 zzzz
    [Tags]    TC1     TC2
	test case : login success
*** Keywords ***

test case : login success
	Fill in username and password as    demo     mode
	Click login button
	Welcome Page should be opened

Welcome Page should be opened
	Title Should Be    Welcome Page
	Location Should Be    ${WELCOME PAGE}
	Element Should Contain    xpath=//div/h1    Welcome Page
	Page should contain link    xpath=//a[@href='.']    text()=logout    timeout=5


