*** Settings ***
Resource        resource_init.robot
# Suite Setup     Open Web Ais Play Production
Test Teardown   Close Browser    ALL  

*** Test Cases ***
StopAndPlay
    Open Browser    https://aisplay.ais.co.th/portal/serial/series/60196c249cd6904c7d6eb50a
    ${status}    Run Keyword And Return Status    
    ...    Wait For Elements State    //iframe[@class="ytp-ad-text ytp-ad-preview-text"]    visible
    # Log      ${status}   console=yes
    IF  ${status} == ${true}
        Click    //ytd-button-renderer[@class="style-scope ytd-masthead"]//span[normalize-space(text())="Sign in"]
        Fill Text    //input[@type="email"]    elysium1604@gmail.com
        Click    //div[@class="VfPpkd-RLmnJb"]
        Fill Text    //input[@type="password"]    Nefarious@7135
        Click    //div[@class="VfPpkd-RLmnJb"]
        Click    //span[@class="VfPpkd-vQzf8d" and normalize-space(text())="Continue"]
        Go To    https://www.youtube.com/watch?v=moiCaseuQ7k
        Click    //span[@class="VfPpkd-vQzf8d" and normalize-space(text())="Not now"]
    ELSE
    Press Keys    //button[@class="ytp-play-button ytp-button"]    Space   
    Mouse Move Relative To    //span[@class="ytp-volume-area"]    x=-50
    Sleep    3s
    Press Keys    //button[@class="ytp-play-button ytp-button"]    Space
    Mouse Move Relative To    //span[@class="ytp-volume-area"]    x=100
    END
