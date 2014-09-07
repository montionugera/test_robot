*** Settings ***
#Documentation Reuse Keywords and Varible for login page

*** Keywords ***
Go to login page
    [Documentation]     xxxxx
    ...                 yyyy
    ...                 zzzz
	Go TO    ${LOGIN PAGE}

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


