*** Settings ***
Library      Browser   #External libraries  https://github.com/MarketSquare/robotframework-browser
Library      BuiltIn   #Libraries and tools that are bundled with the framework
Library      String    #https://robotframework.org/robotframework/latest/libraries/String.html
Library      Collections    #https://robotframework.org/robotframework/latest/libraries/Collections.html
Library      DateTime   #https://robotframework.org/robotframework/latest/libraries/DateTime.html
# อ่านเพิ่มเติมที่เว็บหลักครับ: https://robotframework.org/

*** Variables ***
# เป็นส่วนของการประการค่าตัวแปรเพื่อง่ายต่อการเรียกใช้งาน ซึ่งจะมี 3 รูปแบบครับ
1. Scalar
2. List
3. Dictionaries

*** Keywords ***
# เป็นส่วนของการเขียน Function หรือชุดคำสั่งที่เราเขียนเพื่อนำไป เรียกใช้งานได้หลายๆ ครั้ง

*** Test Cases ***
# เป็นส่วนที่ใช้ในการเขียนสิ่งที่เราจะ Test ลงไป เช่นสเต็ปการเทสเรื่องจากตรงไหน มีการกดอะไรบ้าง เช็คอะไรบ้างหรืออื่นๆ
