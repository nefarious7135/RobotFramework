*** Settings ***
Resource        resource_init.robot
# Suite Setup     Open Web Ais Play
Test Teardown   Close Browser    ALL  

*** Test Cases ***
VerifyResolutionVDORandom
    New Browser    chromium   headless=False
    New Context    viewport={'width': 768, 'height': 768}
    New Page    https://aisplay.ais.co.th/portal/live?vid=60811938fa3813c616f38b63   
    Click    //button[@class="login-type-btn guest"]
    Click    //button[@class="accept-btn"] 
    Hover    ${VDO_player}     
    Click    ${VDO_player} >>> //button[@class="vjs-menu-button vjs-menu-button-popup vjs-icon-cog vjs-button"]
    Wait For Elements State    ${VDO_player} >>> ${ShowRsl}    visible
    Sleep    1s
    ${Elements}    Get Elements    ${VDO_player} >>> ${Ele_Rsl}
    ${Length}    Get Length    ${Elements}
    FOR  ${i}  IN RANGE     1    ${Length}+1
        ${Actual_Rsl}     Get Text    xpath=${VDO_player} >>> (//span[@class="vjs-menu-item-text"]//span[@class="short-b-label"])[${i}]
        Click    xpath=${VDO_player} >>> (//ul[@class="vjs-menu-content"]//li[@class="vjs-menu-item"])[${i}]
        Log     ${Actual_Rsl}    console=yes
        Click     ${VDO_player} >>> ${btn_Rsl}
        Sleep     1s
        Wait For Elements State    ${VDO_player} >>> //li[@class="vjs-menu-item vjs-selected"]//span[normalize-space(text())="${Actual_Rsl}"]   visible
    END
    
    
    
    
   


    #     Click     xpath=${VDO_player} >>> (//ul[@class="vjs-menu-content"]//li[@class="vjs-menu-item"])[${i}]
    #     Sleep     1s
    #     Click     ${VDO_player} >>> ${btn_Rsl}
    #     Wait For Elements State    ${VDO_player} >>> //li[@class="vjs-menu-item vjs-selected"]//span[normalize-space(text())="${Actual_Rsl}"]   visible
    # END
    # Take Screenshot    fullPage=True
    