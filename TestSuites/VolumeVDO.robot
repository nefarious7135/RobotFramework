*** Settings ***
Resource        resource_init.robot
Suite Setup     Open Web Ais Play
Test Teardown   Close Browser    ALL  

*** Test Cases ***
StopAndPlay
    Hover    ${VDO_player} >>> //div[@class="vjs-big-play-button-block"]     
    ${status}    Run Keyword And Return Status    
    ...    Wait For Elements State    
    ...    ${VDO_player} >>> //button[@class="vjs-mute-control vjs-control vjs-button vjs-vol-0"]   visible    3s
    IF  ${status} == ${true}
        Hover    ${VDO_player} >>> //div[@class="vjs-big-play-button-block"] 
        Wait For Elements State    ${VDO_player} >>> //div[@class="vjs-control-bar"]    visible
        Hover    
        ...    ${VDO_player} >>> //div[contains(concat('',normalize-space(@class),''),'vjs-volume-panel vjs-control vjs-volume-panel-horizontal')]
        Wait For Elements State    ${VDO_player} >>> //div[@class="vjs-volume-panel vjs-control vjs-volume-panel-horizontal vjs-hover"]    visible
        Wait For Elements State    ${VDO_player} >>> //div[@class="vjs-volume-bar vjs-slider-bar vjs-slider vjs-slider-horizontal"]
        Drag And Drop Relative To     
        ...    ${VDO_player} >>> //div[@class="vjs-volume-level"]      x=-5      
        Sleep    5s
        Take Screenshot    fullPage=True
    ELSE
        Fail    ไม่สามารถทำงานได้  
    END
