*** Settings ***
Resource        ./resource_init.robot
# Suite Setup     Open Web Ais Play Production
Test Teardown   Close Browser    ALL 
# Comedy Movies", "Anime", "AIS PLAY Originals"
*** Test Cases ***
Hard 2
    Open Browser     https://aisplay.ais.co.th
    Click    //button[@class="login-type-btn guest"]
    Click    //button[@class="accept-btn"]
    WHILE     ${True}    limit=5  
        Scroll By        vertical=50%    horizontal=0%    behavior=smooth  
        Scroll To Element    selector=//section[@id="anime"] 
        Scroll To Element    selector=//section[@id="aisplayoriginals"]  
        Scroll To Element    selector=//section[@id="comedymovies"]   
        Sleep    3s
        Take Screenshot     fullPage=${True}
        BREAK
    END
    
    
         

