*** Settings ***
Resource        ./resource_init.robot
Suite Setup     Open Web Ais Play Production
Test Teardown   Close Browser    ALL  

*** Test Cases ***
Answer_Advance : Problem 1 - Verify All Element ของหน้า Series Season Detail โดยใช้ Loop
    [Documentation]    Owner: Patipan.w
    ...    *** Pre-codition ***
    ...      - เวลาในการทำ : ไม่จำกัด
    ...      - web: https://aisplay.ais.co.th/portal/  
    ...    ==> 
    ...    *** Condition ***
    ...      1. Verify โดยใช้ Loop และ Scroll Mouse 
    ...       (1.1) Scroll Mouse เพื่อไปยังตำแหน่งของ Section "EP" หรือ "Season" และ ใช้ Loop เพื่อ Verify 
    ...             แต่ ไม่กำหนดจำนวนของ Loop ให้ Loop ตามจำนวนของ "EP" หรือ "Season" ที่แสดงอยู่ในหน้า Series Season Detail ปัจจุบัน
    ...      2. ใช้ Regular Expression ในการดัก Pattern  
    ...       (2.1) ชื่อ "EP หรือ Season" ว่าต้องเป็นค่าอะไรก็ได้ แต่ห้ามเป็น Null หรือ Empty 
    ...       (2.2) ชื่อ "Episode หรือ Part" ที่เป็น List ที่อยู่ภายใต้ "EP หรือ Season" จะต้องเป็นค่าอะไรก็ได้ แต่ห้ามเป็น Null หรือ Empty 
    ...       (2.3) "ยอดคนดู หรือ View" ที่อยู่ใน "รูป Poster" ว่าต้องเป็นค่าอะไรก็ได้ แต่ห้ามเป็น Null หรือ Empty 
    ...      3. แต่ละ "Episode หรือ Part" จะต้องมี "รูป Poster"
    ...      4. ถ้ามี ปุ่ม "Subscribe" ให้ Verify Text ว่าต้องเป็น "Subscribe" ห้ามเป็นคำอื่น แต่ถ้าไม่มี ให้ Verify ว่าจะต้องเป็น "ระยะเวลา" หรือ "Video Time"
    ...      5. จะต้องมี Icon "eyes" แสดงอยู่บน "รูป Poster"    
    ...    ==>
    ...    *** Test Step ***
    ...     1. เปิดเว็บ
    ...     2. [1] ใช้คำสั่ง "Go To" และ ระบุ Link url ของ เรื่อง Series Season Detail Page ที่ต้องการ ทดสอบ                                      
    ...    ==>
    ...    *** Expect Result ***
    ...     [1]  Verify List Section ที่เป็น "EP" หรือ "Season" ตามเงื่อนไข (1.1), (2.1), (2.2), (2.3), 3, 4, 5.
    ...    ==>
    [Tags]     01
    Go To     ${web.attack_on_titan}
    Verify All Element On Series Season Detail Page