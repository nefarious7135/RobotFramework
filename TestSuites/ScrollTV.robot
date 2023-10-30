*** Settings ***
Resource        ./resource_init.robot
# Suite Setup     Open Web Ais Play Production
# Test Teardown   Close Browser    ALL  

*** Test Cases ***
Verify Live TV Player    
    Open Browser     https://aisplay.ais.co.th/portal/live?vid=60811938fa3813c616f38b63
    Click    //button[@class="login-type-btn guest"]
    Click    //button[@class="accept-btn"]   
    Scroll To        selector=//div[@class="container-fluid bg-block list-wrapper px-0"]    vertical=50%    horizontal=0%    behavior=smooth
    Wait For Elements State    //div[@class="container-fluid bg-block list-wrapper px-0"]//div[normalize-space(text())='808']   visible
    Click    //div[@class="container-fluid bg-block list-wrapper px-0"]//div[normalize-space(text())='808']
    Sleep    5s
    Take Screenshot   fullPage=True