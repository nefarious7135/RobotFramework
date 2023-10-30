*** Settings ***
Resource        ../resource_init.robot
Suite Setup     Open Web Ais Play Production
Test Teardown   Close Browser    ALL 

*** Test Cases ***
Hard 1
    Click      //button[@class="navbar-toggler nav-heading-toogle"]
    ${listtext}     Get Elements   //li[@class="side-bar-list-item"]
    ${Length}     Get Length      ${listtext}
    ${list_menu_actual}   Create List
    FOR    ${Index}    IN RANGE     1    ${Length}+1
        Wait For Elements State     //li[@class="side-bar-list-item"][${Index}]//span    visible     1s
        ${sideMenu}     Get Text    //li[@class="side-bar-list-item"][${Index}]//span
        Append To List            ${list_menu_actual}   ${sideMenu}
        Wait For Elements State     //li[@class="side-bar-list-item"][${Index}]//img      visible
        Wait For Elements State     //li[@class="side-bar-list-item"]//span[@class="side-bar-list-link-text" and normalize-space(text())="${sideMenu}"]     visible
        Should Match Regexp    ${sideMenu}    .+
        Log     ${sideMenu}   console=${true}
    END
    Lists Should Be Equal    ${list_menu_actual}    ${list_msg_sidemenu}    ignore_order=${True}
    
    