*** Settings ***
Library			Selenium2Library
Test Template    test case : login fail
Suite Setup     Open the login page
Test Setup   	Go to login page
Suite Teardown  Close Browser
Resource        resources/login.robot

*** Variables ***
${LOGIN PAGE}    http://localhost:7272/html/
${ERROR PAGE}    ${LOGIN PAGE}error.html

${ERROR PAGE TITLE}    Error Page
${RIGHT USER}     demo
${RIGHT PASS}     mode
${INVALID INPUT}     abc


*** Testcases ***                   USERNAME            PASSWORD

empty username empty PWD            ${EMPTY}		    ${EMPTY}

invalid username invalid PWD    	${INVALID INPUT}	${INVALID INPUT}
invalid username right PWD    	    ${INVALID INPUT}	${RIGHT PASS}

right username empty PWD            ${RIGHT USER}		${EMPTY}
right username and invalid PWD      ${RIGHT USER}		${INVALID INPUT}


*** Keywords ***

test case : login fail
	[Arguments]    ${username}    ${password}
	Fill in username and password as    ${username}    ${password}
	Click login button
	Error Page should be opened

Error Page should be opened
	Title Should Be    ${ERROR PAGE TITLE}
	Location Should Be    ${ERROR PAGE} 
	Element Should Contain    xpath=//div/h1    ${ERROR PAGE TITLE}
