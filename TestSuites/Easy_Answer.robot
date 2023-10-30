*** Settings ***
Resource        ./resource_init.robot
Suite Setup     Open Web Ais Play Production
Test Teardown   Close Browser    ALL  

*** Test Cases ***
Answer_Easy_Day1 : Problem 1 - Verify Element
    [Documentation]    Owner: Patipan.w
    ...    *** Pre-codition ***
    ...      - เวลาในการทำ : 30 นาที
    ...      - web: https://aisplay.ais.co.th/portal/  
    ...    ==> 
    ...    *** Recommended Keywords ***
    ...      - แนะนำ Keyword ที่ใช้
    ...          1. Should Be Equal As Strings         ---> https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
    ...          2. Get Text                           ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...          3. Wait For Elements State            ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...          4. Click                              ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...          5. Set Variable    (จะใช้หรือไม่ใช้ก็ได้)   ---> https://robotframework.org/robotframework/latest/libraries/BuiltIn.html 
    ...          6. Evaluate        (จะใช้หรือไม่ใช้ก็ได้)   ---> https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
    ...          7. Take Screenshot (จะใช้หรือไม่ใช้ก็ได้)   ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...          8. Log            (จะใช้หรือไม่ใช้ก็ได้)    ---> https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
    ...      - แนะนำการใช้ Loop
    ...          1. For Loop In Robot Framework (จะใช้หรือไม่ใช้ก็ได้)  ---> https://robocorp.com/docs/languages-and-frameworks/robot-framework/for-loops
    ...    ==> 
    ...    *** Condition ***
    ...      - For Loop In Robot Framework (จะใช้หรือไม่ใช้ก็ได้)
    ...    ==>
    ...    *** Test Step ***
    ...      1. เปิดเว็บ
    ...      2. [1] กดปุ่ม "Hamberger" เมนู                                              
    ...    ==>
    ...    *** Expect Result ***
    ...      [1] Verify all element side menu
    ...    ==>
    [Tags]     01
    Go To Side Menu Hamburger
    # Verify Side Menu Hamburger (No Loop) ตัวอย่างที่ 1
    Verify Side Menu Hamburger (Loop) ตัวอย่างที่ 2
    Verify Side Menu Hamburger (Loop) ตัวอย่างที่ 3

Answer_Easy_Day1 : Problem 2 - Verify Live TV Page
    [Documentation]    Owner: Kachain.a
    ...    *** Pre-codition ***
    ...      - เวลาในการทำ : 30 นาที
    ...      - web: https://aisplay.ais.co.th/portal/  
    ...    ==> 
    ...    *** Recommended Keywords ***
    ...      - แนะนำ Keyword ที่ใช้
    ...          1. Get Text                           ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...          2. Wait For Elements State            ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...          3. Click                              ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...          4. Take Screenshot (จะใช้หรือไม่ใช้ก็ได้)   ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...          5. Log            (จะใช้หรือไม่ใช้ก็ได้)    ---> https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
    ...    ==> 
    ...    *** Test Step ***
    ...      1. เปิดเว็บ
    ...      2. [1] กดปุ่มแฮมเบอเกอร์เมนู
    ...      3. [2] กดเลือกเมนู ทีวี                                          
    ...    ==>
    ...    *** Expect Result ***
    ...      [1] Verify All Element Side Menu
    ...      [2] Verify Live TV Page
    ...          ---> ต้องเห็นคำว่า "ผังรายการทีวี" หรือ "TV  Program Guides" (พอสังเขป)
    ...    ==>
    [Tags]     02
    Select In Menu Bar LiveTV
    Verify Live TV Page

Answer_Easy_Day1 : Problem 3 - Verify Element (Support 2 Lang TH/EN)
    [Documentation]    Owner: Patipan.w
    ...    *** Pre-codition ***
    ...      - เวลาในการทำ : 30 นาที
    ...      - web: https://aisplay.ais.co.th/portal/  
    ...    ==> 
    ...    *** Recommended Keywords ***
    ...      - แนะนำ Keyword ที่ใช้
    ...          1. Should Be Equal As Strings           ---> https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
    ...          2. Get Text                             ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...          3. Wait For Elements State              ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...          4. Click                                ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...          5. Fill Text                            ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...          6. Run Keyword And Return Status        ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...          6. Take Screenshot   (จะใช้หรือไม่ใช้ก็ได้)   ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...          7. Log               (จะใช้หรือไม่ใช้ก็ได้)   ---> https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
    ...    ==> 
    ...    *** Condition ***
    ...      - Run ครั้ง 1 : TH
    ...      - Run ครั้ง 2 : EN
    ...    ==>
    ...    *** Test Step ***
    ...      1. เปิดเว็บ
    ...      2. กดปุ่ม เข้าสู่ระบบ
    ...      3. กรอกเบอร์: 0123456789
    ...      4. กด รับรหัส OTP
    ...      5. [1] กรอก opt: 1234                                             
    ...    ==>
    ...    *** Expect Result ***
    ...     [1] Verify Alert msg "Error" (ต้องสามารถ Run ได้ทั้ง 2 ภาษา)
    ...     - รหัส OTP ไม่ถูกต้อง กรุณาระบุใหม่อีกครั้ง                       (Thai)
    ...     - You have entered incorrect OTP. Please try again.    (English)
    ...    ==>
    [Tags]     03
    Select Login On Ais Play
    Switch Icon Language On Login Page
    Input Phone Number And Get OTP           0903902821
    Input Invalid OTP And Click OK Button    1234
    Verify Error Invalid OTP Message 

Answer_Easy_Day1 : Problem 4 - Verify Element Is Change
    [Documentation]    Owner: Kachain.a
    ...    *** Pre-codition ***
    ...      - เวลาในการทำ : 30 นาที
    ...      - web: https://aisplay.ais.co.th/portal/  
    ...    ==> 
    ...    *** Recommended Keywords ***
    ...      - แนะนำ Keyword ที่ใช้
    ...          1. Get Text                           ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...          2. Wait For Elements State            ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...          3. Click                              ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...          4. Take Screenshot (จะใช้หรือไม่ใช้ก็ได้)   ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...          5. Should Be Equal                    ---> https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
    ...          6. Should Not Be Equal                    ---> https://robotframework.org/robotframework/latest/libraries/BuiltIn.html    
    ...          7. Log            (จะใช้หรือไม่ใช้ก็ได้)    ---> https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
    ...    ==>
    ...    *** Test Step ***
    ...      1. เปิดเว็บ
    ...      2. กดปุ่มแฮมเบอเกอร์เมนู
    ...      3. กดเลือกเมนู ทีวี
    ...      4. [1] เปลี่ยนช่องเปนช่องใดก็ได้                                         
    ...    ==>
    ...    *** Expect Result ***
    ...      [1] Verify ว่า Channel ถูกเปลื่ยนแปลง และ Chan﻿nel ถูก Active "สีเขียวอยู่"
    ...    ==>
    [Tags]     04
    Select In Menu Bar Livetv
    Select Channel Number Is 2 And Verify Change Channel
