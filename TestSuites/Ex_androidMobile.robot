*** Settings ***
Library     AppiumLibrary

*** Keywords ***
Open Test Application
    Open Application    remote_url=http://192.168.1.6:5037/wd/hub     
    ...     deviceName=samsung SM-J710F   
    ...     platformVersion=8.1   
    ...     platformName=Android
    ...     appPackage=com.material.components
    ...     appActivity=com.material.components.activity.MainMenu



#Swipe    0	  2000ลง    100    100     500ระยะเวลา
*** Test Cases ***
Open Test Application For android
    Open Test Application
    # Tap     id=com.material.components:id/bt_close
    # Swipe    0	 1000    100    100     500
    # Swipe    1000	 500   100    100     500
    # Wait Until Element Is Visible   //android.widget.TextView[@text='Player']     10s
    # Tap     //android.widget.TextView[@text='Player']
    # Wait Until Element Is Visible   //android.widget.TextView[@text='Music Genre Image']     10s
    # Tap     //android.widget.TextView[@text='Music Genre Image']
    # Wait Until Element Is Visible   //android.widget.ImageButton[@resource-id='com.material.components:id/bt_toggle_input']   10s
    # Tap     //android.widget.ImageButton[@resource-id='com.material.components:id/bt_toggle_input']
    # Tap     //android.widget.RadioButton[@index='0']
    # Tap     //android.widget.Button[@index='1']






