*** Settings ***
Resource        resource_init.robot
# Suite Setup     Open Web Ais Play Production
# Test Teardown   Close Browser    ALL  

*** Test Cases ***
Test traning
    Open Browser     https://aisplay.ais.co.th/portal/screen/seriesSTB/
    Click    //button[@class="login-type-btn guest"]
    Click    //button[@class="accept-btn"]
    Click    (//section[@id="top10series"]//div[contains(concat('',normalize-space(@class),''),'d-none d-md-flex')])[2]/button[2]    
    Sleep    1s
    Click    (//section[@id="top10series"]//div[contains(concat('',normalize-space(@class),''),'d-none d-md-flex')])[2]/button[2] 
    Sleep    1s
    Click    (//section[@id="top10series"]//div[contains(concat('',normalize-space(@class),''),'d-none d-md-flex')])[1]/button[1]
    Sleep    1s
    Click    (//section[@id="top10series"]//div[contains(concat('',normalize-space(@class),''),'d-none d-md-flex')])[1]/button[1]
    Sleep    1s
    