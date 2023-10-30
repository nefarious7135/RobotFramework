*** Settings ***
Library     AppiumLibrary

*** Keywords ***
Open Test Application
    Open Application    remote_url=http://localhost:4723/wd/hub     
    ...     deviceName=TestDevice   
    ...     platformVersion=11.0    
    ...     platformName=Android
    ...     appPackage=com.material.components
    ...     appActivity=com.material.components.activity.MainMenu

#Swipe    0	  2000ลง    100    100     500ระยะเวลา
*** Test Cases ***
Open Test Application For android
    Open Test Application
    Tap     id=com.material.components:id/bt_close
    Swipe    0	 1000    100    100     500
    Swipe    1000	 500   100    100     500
    






