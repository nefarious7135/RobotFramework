*** Settings ***
Resource        resource_init.robot
Suite Setup     Open Web Ais Play
Test Teardown   Close Browser    ALL  

*** Test Cases ***
ResolutionVDO
    Hover    ${VDO_player} >>> //div[@class="vjs-big-play-button-block"]     
    Wait For Elements State    ${VDO_player} >>> //div[@class="vjs-control-bar"]    visible
    Sleep     1s
    Click     ${VDO_player} >>> ${btn_Rsl}
    Wait For Elements State    ${VDO_player} >>> ${Wat_Rsl}    visible
    ${Elements}    Get Elements    ${VDO_player} >>> ${Ele_Rsl}
    ${Length}    Get Length    ${Elements}
    FOR  ${i}   ${Expect_Rsl}   IN ENUMERATE    @{Resolution_xxP}
        ${i}    Evaluate    ${i}+1
        Sleep     1s
        ${Actual_Rsl}     Get Text    xpath=${VDO_player} >>> (//span[@class="vjs-menu-item-text"]//span[@class="short-b-label"])[${i}]
        Wait For Elements State     xpath=${VDO_player} >>> //span[normalize-space(text())="${Actual_Rsl}"]    visible
        Should Be Equal As Strings    ${Expect_Rsl}    ${Actual_Rsl}
        Log Many     ${Actual_Rsl}    ${Expect_Rsl}
        Log     ${Actual_Rsl}    console=yes
        Click     xpath=${VDO_player} >>> (//ul[@class="vjs-menu-content"]//li[@class="vjs-menu-item"])[${i}]
        Sleep     1s
        Click     ${VDO_player} >>> ${btn_Rsl}
        Wait For Elements State    ${VDO_player} >>> //li[@class="vjs-menu-item vjs-selected"]//span[normalize-space(text())="${Actual_Rsl}"]   visible
    END
    Take Screenshot    fullPage=True
    