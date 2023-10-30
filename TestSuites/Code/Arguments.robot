*** Settings ***
Library   Browser
Resource  Veriables/variables.robot
Resource  Veriables/keywords.robot
# 14.Click Element โดย รับค่า Arguments และไปแทนค่า Attribute "Text()" ใน Xpath      (Medium) 
#     [Documentation]    ***Owner : QA ***
#     ...    *** Prerequisite Steps ***
#     ...    time: (10 นาที)
#     ...    web: https://aisplay.ais.co.th/portal/
#     ...    
#     ...    ***Test Step Description***
#     ...    1. เปิดเว็บ
#     ...    2. กดปุ่มแฮมเบอเกอร์เมนู
#     ...    3. [1] กดปุ่ม Menu ใดก็ได้ บน Side Menu โดยระบุ Arguments
#     ...
#     ...    ***Expected Result***
#     ...    1. [1] ไปยังหน้า Page Menu ที่กด
#     [Tags]    Day2
*** Keywords ***
ข้อ 14
    [Arguments]    ${side_Menu}
    Open Browser    https://aisplay.ais.co.th/portal/
    Click     //button[@class="login-type-btn guest"]
    Click     //button[@class="accept-btn"]
    Click     //button[@class="navbar-toggler nav-heading-toogle"]
    Click     //span[contains(text(),'${side_Menu}')]
    Log    ${side_Menu}     console=true
    
*** Test Cases ***

รับค่า Arguments
    ข้อ 14    กีฬา





