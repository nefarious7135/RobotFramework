*** Settings ***
Resource        resource_init.robot
Suite Setup     Open Web Ais Play Production
Test Teardown   Close Browser    ALL  

*** Test Cases ***
VerifyMenuAndIcon
    Click    //button[@class="navbar-toggler nav-heading-toogle"]
    ${Element}    Get Elements    //li[@class="side-bar-list-item"]
    ${Length}    Get Length    ${Element}
    FOR  ${i}  IN RANGE    1    ${Length}+1
        ${TextMenu}    Get Text    (//li[@class="side-bar-list-item"])[${i}]
        Wait For Elements State    (//li[@class="side-bar-list-item"])[${i}]//img    visible   #verify icon
        Wait For Elements State    (//li[@class="side-bar-list-item"])//span[text()="${TextMenu}"]    visible    #verify menu
        Log     ${TextMenu}     console=yes
    END
VerifyTextMenu
    Click    //button[@class="navbar-toggler nav-heading-toogle"]    
    FOR    ${i}    ${Expect_menu}    IN ENUMERATE    @{list_msg_sidemenu}    
        ${i}    Evaluate    ${i}+1
        Wait For Elements State    (//li[@class="side-bar-list-item"])[${i}]    visible
        ${Actual_Menu}    Get Text    (//li[@class="side-bar-list-item"])[${i}]//span
        Should Be Equal As Strings    ${Expect_menu}    ${Actual_Menu}
    END
VerifyLengthTextMenu
    Click    //button[@class="navbar-toggler nav-heading-toogle"]    
    FOR    ${i}    ${Expect_menu}    IN ENUMERATE    @{list_msg_sidemenu}    
        ${i}    Evaluate    ${i}+1
        Wait For Elements State    (//li[@class="side-bar-list-item"])[${i}]    visible
        ${Actual_Menu}    Get Text    (//li[@class="side-bar-list-item"])[${i}]//span
        ${Expect_Count}    Get Length    ${Expect_menu}
        ${Actual_Count}    Get Length    ${Actual_Menu}
        Should Be Equal As Numbers    ${Expect_Count}    ${Actual_Count}
    END  
    