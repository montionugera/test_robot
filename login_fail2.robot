*** Settings ***
Library			Selenium2Library
#Test Template    test case : login fail
Suite Setup     Open the login page
Test Setup   	go to login page
Suite Teardown  Close Browser

*** Variables ***
${LOGIN PAGE}    http://localhost:7272/html/
${ERROR PAGE}    ${LOGIN PAGE}error.html

${ERROR PAGE TITLE}    Error Page
${RIGHT USER}     demo
${RIGHT PASS}     mode
${INVALID INPUT}     abc


*** Testcases ***                   USERNAME            PASSWORD
test case : login fail
    [Template]    test case : login fail flow
    #---username---|---password---|
    ${EMPTY}		    ${EMPTY}
    ${INVALID INPUT}	${EMPTY}
    ${INVALID INPUT}	${INVALID INPUT}
    ${INVALID INPUT}	${RIGHT PASS}
    ${RIGHT USER}		${EMPTY}
    ${RIGHT USER}		${INVALID INPUT}


*** Keywords ***
test case : login fail flow
    [Arguments]         ${user}             ${pass}
    test case : login fail    ${user}       ${pass}
    go to login page

go to login page
	Go TO    ${LOGIN PAGE}

test case : login fail
	[Arguments]    ${username}    ${password}
	Fill in username and password as    ${username}    ${password}
	Click login button
	Error Page should be opened

Open the login page
	Open Browser   ${LOGIN PAGE}
	Maximize Browser Window
    Set Selenium Speed  0

Fill in username and password as
	[Arguments]    ${username}    ${password}
	Input Text    name=username_field   ${username}
	Input Text    name=password_field   ${password}

Click login button
	Click Button   LOGIN

Error Page should be opened
	Title Should Be    ${ERROR PAGE TITLE}
	Location Should Be    ${ERROR PAGE}
	Element Should Contain    xpath=//div/h1    ${ERROR PAGE TITLE}
