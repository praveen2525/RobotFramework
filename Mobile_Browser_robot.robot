*** Settings ***
Library    Selenium2Library
Library    AppiumLibrary
Library    String

*** Variables ***
${URL}            https://paytm.com/
${BROWSER}        CHROME
${Delay}        15s
${Username}    8892501639
${Password}    praveen2525

${REMOTE_URL}     http://localhost:4723/wd/hub
${PLATFORM_NAME}    Android
${PLATFORM_VERSION}    6.0
${DEVICE_NAME}    01157df154e0d21d
${ele}     com.android.mms:id/list_item_text_view


*** Test Cases ***
[TC-001]-Launching the browser and enter paytm credentials
    Launch Browser
	sleep    ${Delay}
    Select login_option
    Input Credentials
    sleep    ${Delay}
    Collect OTP from Mobile
	Input OTP
	sleep    ${Delay}
	

	
*** Keywords ***
Launch Browser
    Open Browser    ${URL}  ${BROWSER}
    Maximize Browser Window
	
	
Select login_option
   #click button   xpath=//div[text()='Log In/Sign Up']
   Selenium2Library.Click Element    xpath=//div[text()='Log In/Sign Up']
 

Input Credentials
    Select Frame    tag=iframe
    Selenium2Library.Click Element    name=username  
	Selenium2Library.Input Text    name=username    ${Username}
    Selenium2Library.Input Text    name=password    ${Password}
	Selenium2Library.Click Element    xpath=.//*[@id='loginForm']/div/md-content/button[1]
	
Input OTP
    Selenium2Library.Input Text    name=otp    ${output}
	
	Selenium2Library.Click Element    xpath=.//*[@id='verifyOTPForm']/div/div[2]/md-content/button[1]
	

Collect OTP from Mobile
   
    Open Application  ${REMOTE_URL}  platformName=Android  platformVersion=${PLATFORM_VERSION}  deviceName=01157df154e0d21d    automationName=appium  appPackage=com.android.mms    appActivity=.ui.ConversationComposer
 
	#AppiumLibrary.Click Element    text=IPAYTM
	AppiumLibrary.Click Element    xpath=//*[contains(@text,'PAYTM')]
	AppiumLibrary.Click Element    id=${ele}
    ${STATUS} =    AppiumLibrary.Get Text   id=${ele}
    Set Test Variable    ${STATUS}
    log    ${STATUS}
	${output}=    Get Substring     ${STATUS}   4    10
	
	Set Test Variable    ${output}
	log    ${output}
	
	