*** Settings ***
Resource        ./resource_init.robot
# Suite Setup     Open Web Ais Play Production
# Test Teardown   Close Browser    ALL  

*** Test Cases ***
Verify Live TV Player    
    Open Browser     https://aisplay.ais.co.th/portal/live?vid=60811938fa3813c616f38b63
    Click    //button[@class="login-type-btn guest"]
    Click    //button[@class="accept-btn"]
    ${Elements}    Get Elements    selector=${lst_cha}   
    ${Length}     Get Length    ${Elements}
    ${Expect}    Create List    
    FOR  ${i}  IN RANGE  1    ${Length}+1
        ${Text}    Get Text    xpath=(${lst_txt_cha})\[${i}]
        Append To List    ${Expect}    ${Text}   
    END
    ${Random_cha}  Evaluate  random.choice($Expect)  random    #Random data in list.
    Scroll To Element    //div[@class="col-11 row px-0 mx-0 flex-nowrap"]//div[normalize-space(text())='${Random_cha}']
    Sleep    2s
    ${Before_click_txt}     Get Text    (//div[@class="col-11 row px-0 mx-0 flex-nowrap"]//div[normalize-space(text())='${Random_cha}']/..//span)[1]
    Take Screenshot   fullPage=True
    Click    //div[@class="container-fluid bg-block list-wrapper px-0"]//div[normalize-space(text())='${Random_cha}']
    ${After_click_txt}    Get Text    //h3[@class="d-block live-text-text mb-0 font-weight-normal"]
    Should Be Equal As Strings    ${After_click_txt}    ${Before_click_txt}
    Sleep    2s
    Take Screenshot   fullPage=True

