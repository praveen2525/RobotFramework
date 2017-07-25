** Settings ***
Library           AppiumLibrary

Library        String
Library    XML
Library           Process

*** Variables ***
${REMOTE_URL}     http://localhost:4723/wd/hub
${PLATFORM_NAME}    Android
${PLATFORM_VERSION}    6.0
${DEVICE_NAME}    01157df154e0d21d
${ele}     com.android.mms:id/list_item_text_view

*** Keywords ***

add new contact
    
    Open Application  ${REMOTE_URL}  platformName=Android  platformVersion=${PLATFORM_VERSION}  deviceName=01157df154e0d21d    automationName=appium  appPackage=com.android.mms    appActivity=.ui.ConversationComposer
    #AppiumLibrary.log
	#Click Element    id=com.android.mms:id/subject    
    #Tap    xpath=//*[contains(@text,'IPAYTM')]
    Click Element    partial_text=PAYTM
	#Click Element    xpath=//*[contains(@text,'IPAYTM')]
	#Click Element    xpath=//android.view.View[@text='*.text.*']
	
	Click Element    id=${ele}
    ${STATUS} =    Get Text   id=${ele}
    Set Test Variable    ${STATUS}
    log    ${STATUS}
	
	 
	#${output}=    fetch_from_left     ${STATUS}   [:2]
	#${output}=    split_string     ${STATUS}   ${SPACE}
	${output}=    Get Substring     ${STATUS}   4    10
	
	Set Test Variable    ${output}
	log    ${output}
	
Cleanup
    Click Element    name=Delete
	Click Element    class=android.widget.CheckBox
	Click Element    name=Delete
  
	
	
	
	
	
	

*** Test Cases ***
add_contact
   
    add new contact
	logcat
#[Teardown]
#| | ${logcat}= | Run process | adb | logcat | -d    |    stdout=logcat.txt
    #Cleanup


	

   