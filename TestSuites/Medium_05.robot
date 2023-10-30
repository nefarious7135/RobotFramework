*** Settings ***
Resource        resource_init.robot
Suite Setup     Open Web Ais Play Production
Test Teardown   Close Browser    ALL  

*** Test Cases ***
Problem 5 - Verify Search And Movie Page 
    Search On Aisplay Top Header Bar    ${search_name} 
    ${status}    Run Keyword And Return Status    
    ...    Wait For Elements State    (//div[@title="${search_name}"])[1]    visible    
    IF    '${status}' == 'True'
            ${Titlename}    Get Text     (//section[@id="movies"]//h3)[1]
            Click    (//section[@id="movies"]//img)[1]
            Wait For Elements State    //h3[@class="default-title"]/span    visible
            Sleep    5s
            Take Screenshot      fullPage=${True}
            Verify Text On Elements    //h3[@class="default-title"]/span    ${Titlename}
    ELSE  
        Fail     "กรุณาเช็ค Movies ของคุณอีกครั้ง"    
    END
    