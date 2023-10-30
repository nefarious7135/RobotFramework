*** Settings ***
Resource        resource_init.robot

*** Test Cases ***
Login
    New Browser    chromium   headless=False
    New Context    viewport={'width': 1366, 'height': 768}
    New Page    http://core-tsrl-web.geccloud.com/login.html
    Fill Text    //input[@id="txt_username"]    admin
    Fill Text    //input[@id="txt_password"]    @dMin#1234
    Click        //button[@class="btn btn-primary px-4 "]//span[normalize-space(text())="เข้าสู่ระบบ"]
    Click    //span[@aria-controls="branch_id_listbox"]
    Click    (//div[@class="k-list-content k-list-scroller"]//span)[1]
    Click        //button[@class="btn btn-primary px-4 "]//span[normalize-space(text())="ยืนยัน"]
    Wait For Elements State    //header[@class="header header-sticky"]    visible
    Take Screenshot    fullPage=True


SelectOptionsBy
    Open Browser    http://core-tsrl-web.geccloud.com/login.html
    Fill Text    //input[@id="txt_username"]    admin
    Fill Text    //input[@id="txt_password"]    @dMin#1234
    Click        //button[@class="btn btn-primary px-4 "]//span[normalize-space(text())="เข้าสู่ระบบ"]
    Click        //span[@aria-controls="branch_id_listbox"]
    Wait For Elements State    //ul[@aria-hidden="false" and @id="branch_id_listbox"]    visible
    ${Elements}    Get Elements    //div[@class="k-list-content k-list-scroller"]//li
    ${Length}    Get Length    ${Elements}
    # ${selected}    Select Options By    //ul[@aria-hidden="false" and @id="branch_id_listbox"]    index    0    2
    FOR  ${i}  IN RANGE     1    ${Length}+1
        ${Text}     Get Text    (//div[@class="k-list-content k-list-scroller"]//span[@class="k-list-item-text"])[${i}]
        Log     \n${Text}     console=yes
    END
    Take Screenshot    fullPage=True