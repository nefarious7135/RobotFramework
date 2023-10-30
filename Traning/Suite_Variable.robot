*** Settings ***
Suite Setup      Log    "Setup Web Application"   console=yes
# ก่อนที่จะเริ่ม Run Test ทั้งหมด จะต้องเริ่มการทำงานตัวนี้ก่อน
Test Setup       Log    >> Login with username: kachain   console=yes
# ก่อนที่จะเริ่มเข้า Test Case ให้เริ่มการกระทำนี้ก่อน
Test Teardown    Log    ... Logout And Clear cache   console=yes
# หลังจากจบ Test Case แต่ละ Case ให้ทำการกระทำนี้
Suite Teardown   Log    -- Close Web Application --   console=yes
# หลังจาก Run Test เสร็จทั้งหมดแล้วจะสั่งให้ทำอะไรตอนสุดท้าย

*** Test Cases ***
TC1
    [Documentation]    Owner: Kachain.a
    ...    *** Example ***
    ...      - Suite Setup
    ...      - Test Setup
    ...      - Test Teardown
    ...    ==> 
    [Tags]    ตัวอย่างการใช้งาน 
    Log     "Test case1 : On Processing..."   console=yes

TC2
    [Documentation]    Owner: Kachain.a
    ...    *** Example ***
    ...      - Test Setup
    ...      - Test Teardown
    ...    ==> 
    [Tags]    ตัวอย่างการใช้งาน 
    Log     "Test case2 : On Processing..."   console=yes

TC3
    [Documentation]    Owner: Kachain.a
    ...    *** Example ***
    ...      - Test Setup
    ...      - Test Teardown
    ...      - Suite Teardown
    [Tags]    ตัวอย่างการใช้งาน 
    [Setup]     Log    ** Login with username: prayuth   console=yes
    Log     "Test case3 : On Processing..."   console=yes
