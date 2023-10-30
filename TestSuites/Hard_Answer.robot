*** Settings ***
Resource        ./resource_init.robot
Suite Setup     Open Web Ais Play Production
Test Teardown   Close Browser    ALL  

*** Test Cases ***
Answer_Hard_Day2 : Problem 1 - Loop Verify
    [Documentation]    Owner: Patipan.w
    ...    *** Pre-codition ***
    ...      - เวลาในการทำ : 1 ชั่วโมง
    ...      - web: https://aisplay.ais.co.th/portal/  
    ...    ==> 
    ...    *** Recommended Keywords ***
    ...      - แนะนำ Keyword ที่ใช้
    ...          1. Should Match Regexp                   ---> https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
    ...          2. Get Text                              ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...          3. Wait For Elements State               ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...          4. Get Elements                          ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...          5. Get Length                            ---> https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
    ...          6. Click                                 ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...          7. Should Be Equal As Strings            ---> https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
    ...          8. Take Screenshot   (จะใช้หรือไม่ใช้ก็ได้)    ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...          9. Log               (จะใช้หรือไม่ใช้ก็ได้)    ---> https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
    ...      - แนะนำการใช้ Loop
    ...          1. For Loop In Range   ---> https://robocorp.com/docs/languages-and-frameworks/robot-framework/for-loops
    ...    ==> 
    ...    *** Condition ***
    ...      - ใช้ Loop โดย ไม่กำหนดจำนวนของ Loop ให้ Loop ตามจำนวนที่ Element "Text" Side Menu ที่แสดงอยู่ในปัจจุบัน
    ...      - ใช้ "Get Elements" เพื่อเก็บ Element และ "Get Length" เพื่อนับจำนวน และ ใช้ "For Loop In Range" เพื่อ Loop ตามจำนวนที่ "Get Length" ของ Elements ที่ได้
    ...      - ใช้ Regular Expression ในการดัก Pattern ว่าต้องเป็นค่าอะไรก็ได้ แต่ห้ามเป็น Null หรือ Empty (.+)
    ...    ==>
    ...    *** Test Step ***
    ...      1. เปิดเว็บ
    ...      2. กดปุ่มแฮมเบอเกอร์เมนู
    ...      3. [1] Verify Side Menu                                      
    ...    ==>
    ...    *** Expect Result ***
    ...      [1] Verify Side Menu
    ...      ---> Loop และ Verify "Icon" ของ Menu ใน Side Menu ว่าจะต้อง ถูกแสดงอยู่่ (visible)
    ...      ---> Loop และ Verify "Text" ของ Menu ใน Side Menu ว่าห้ามเป็นค่า "Null" หรือ "Empty" แต่เป็นค่าอะไรก็ได้ (.+)
    ...      ---> จำนวน ที่ "Get Length" ของ "Icon" และ "Text" ที่อยู่ใน Side Menu จะต้องมี "จำนวนเท่ากัน"
    ...    ==>
    [Tags]     01


Answer_Hard_Day2 : Problem 2 - Loop Verify
    [Documentation]    Owner: Patipan.w
    ...    *** Pre-codition ***
    ...      - เวลาในการทำ : 1 ชั่วโมง
    ...      - web: https://aisplay.ais.co.th/portal/  
    ...    ==> 
    ...    *** Recommended Keywords ***
    ...      - แนะนำ Keyword ที่ใช้
    ...          1. "Scroll By" หรือ "Scroll To" หรือ "Scroll To Element"     ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...          3. Wait For Elements State                                 ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...          4. Run Keyword And Return Status                           ---> https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
    ...          5. Take Screenshot   (จะใช้หรือไม่ใช้ก็ได้)                      ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...          6. Sleep             (จะใช้หรือไม่ใช้ก็ได้)
    ...      - แนะนำการใช้ Loop
    ...          1. While Loop   ---> https://robocorp.com/docs/languages-and-frameworks/robot-framework/while-loops
    ...    ==> 
    ...    *** Condition ***
    ...      - ใช้ While Loop จนกว่าจะเจอ Section "ที่ระบุ" เช่น "Comedy Movies", "Anime", "AIS PLAY Originals". จากนั้น ใช้ "Break" เพื่อ ออกจาก While Loop
    ...    ==>
    ...    *** Test Step ***
    ...      1. เปิดเว็บ
    ...      2. อยู่หน้า Home AIS PLAY
    ...      3. [1] Scroll Mouse Down จนกว่าจะเจอ Section "ที่ระบุ" 
    ...      เช่น "Comedy Movies", "Anime", "AIS PLAY Originals".                                  
    ...    ==>
    ...    *** Expect Result ***
    ...      [1]  While Loop จนกว่าจะเจอ Section "ที่ระบุ" หากเจอแล้ว ใช้ Break เพื่อ ออกจาก While Loop
    ...    ==>
    [Tags]     02
