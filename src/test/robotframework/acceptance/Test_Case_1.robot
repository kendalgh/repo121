*** Settings ***
Library  Selenium2Library
Library  com.testtalks.robot.Setup
Documentation
...    Login Test Case.


*** Variables ***
#Signup Page
${signupLocator}  xpath=(//a[contains(text(),'Signup')])[3]
#Other
${Driver_Path}  C:${/}webdriver${/}chromedriver.exe
${Browser}  Chrome
${URL}  https://www.phptravels.net/signup
${URL2}  https://www.phptravels.net/login

#region General Variables
${cookieStopLocator}  id=cookie_stop
#endregion

#region Signup Page Variables
*** Variables ***
${firstNameLocator}  name=first_name
${lastNameLocator}   name=last_name
${phoneLocator}      name=phone
${emailLocator}      name=email
${passwordLocator}   name=password
#endregion

#region Login Page Variables
*** Variables ***
${loginEmailLocator}     xpath=(//input[@name='email'])[1]
${loginPasswordLocator}  name=password
#endregion

*** Keywords ***
Click CookieStop
    [Documentation]  Click on the CookieStop BUTTON element
    Click Element  ${cookieStopLocator}

#region Signup Page Keywords
*** Keywords ***
Set FirstName
    [Arguments]  ${firstNameValue}
    [Documentation]  Set FirstName INPUT element value
    Input Text  ${firstNameLocator}  ${firstNameValue}

Set LastName
    [Arguments]  ${lastNameValue}
    [Documentation]  Set LastName INPUT element value
    Input Text  ${lastNameLocator}  ${lastNameValue}

Set Phone
    [Arguments]  ${phoneValue}
    [Documentation]  Set Phone INPUT element value
    Input Text  ${phoneLocator}  ${phoneValue}

Set Email
    [Arguments]  ${emailValue}
    [Documentation]  Set Email INPUT element value
    Input Text  ${emailLocator}  ${emailValue}

Set Password
    [Arguments]  ${passwordValue}
    [Documentation]  Set Password INPUT element value
    Input Text  ${passwordLocator}  ${passwordValue}
#endregion

#region Login Page Keywords
*** Keywords ***
Set LoginEmail
    [Arguments]  ${loginEmailValue}
    [Documentation]  Set Login Email INPUT element value
    Input Text  ${loginEmailLocator}  ${loginEmailValue}

Set LoginPassword
    [Arguments]  ${loginPasswordValue}
    [Documentation]  Set Login Password INPUT element value
    Input Text  ${loginPasswordLocator}  ${loginPasswordValue}
#endregion


*** Keywords ***
Click Signup
    [Documentation]  Click on the Signup A element
    Click Element  ${signupLocator}


*** Test Cases ***
TC_001 Signup Test
    Browser Setup
	Open Browser  ${URL}  ${Browser}
	Maximize Browser Window
	Click CookieStop
#	Wait Until Element Is Visible  ${signupLocator}
	Set FirstName  Test
	Sleep  1s
	Set LastName  User
    Sleep  1s
	Set Phone  +251911122345
	Sleep  1s
	Set Email  testuser@gmail.com
    Sleep  1s
	Set Password  123456789
    Sleep  1s
	Submit Form
	Sleep  5s
	Close Browser

#region Home Page Tests
*** Variables ***
${homeLocator}  link=Home

*** Keywords ***
Click Home
    [Documentation]  Click on the Home A element
    Click Element  ${homeLocator}

*** Variables ***
${select2SearchFieldLocator}  css=input[class*='select2-search__field']
${checkinLocator}             id=checkin
${element24Locator}           xpath=//div[3]/div[1]/table/tbody/tr[4]/td[4]
${checkoutLocator}            id=checkout
${element243Locator}          xpath=//div[4]/div[1]/table/tbody/tr[4]/td[4]
${travellers2Locator}         css=form[id='hotels-search'] > div > div > div:nth-of-type(3) > div > div > div > a
${submitLocator}              xpath=(//button[@id='submit'])[1]

*** Keywords ***
Set Select2SearchField
    [Arguments]  ${select2SearchFieldValue}
    [Documentation]  Set Select2SearchField INPUT element value
    Input Text  ${select2SearchFieldLocator}  ${select2SearchFieldValue}

Set Checkin
    [Arguments]  ${checkinValue}
    [Documentation]  Set Checkin INPUT element value
    Input Text  ${checkinLocator}  ${checkinValue}

Set Checkout
    [Arguments]  ${checkoutValue}
    [Documentation]  Set Checkout INPUT element value
    Input Text  ${checkoutLocator}  ${checkoutValue}

Click Travellers2
    [Documentation]  Click on the Travellers2 A element
    Click Element  ${travellers2Locator}

Click Submit
    [Documentation]  Click on the Submit BUTTON element
    Click Element  ${submitLocator}
#endregion

*** Test Cases ***
TC_002 Login & Home Test
    Browser Setup
	Open Browser  ${URL2}  ${Browser}
	Maximize Browser Window
	Click CookieStop
	Set LoginEmail  testuser@gmail.com
	Sleep  1s
	Set LoginPassword  123456789
	Sleep  1s
	Submit Form
	Sleep  5s
    Click Home
    Sleep  1s
    Set Select2SearchField  Bethel,United States
    Sleep  1s
    Set Checkin  20-11-2021
    Sleep  1s
    Set Checkout  26-11-2021
    Sleep  1s
    Click Travellers2
    Sleep  1s
    Click Submit

	Close Browser