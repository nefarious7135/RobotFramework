*** Settings ***
Resource        ./resource_init.robot
# Suite Setup     Open Web Ais Play Production
# Test Teardown   Close Browser    ALL  

*** Test Cases ***
Answer_Medium_Day2 : Problem 3 - Verify Search Found
    [Documentation]    Owner: Kachain.a
    ...    *** Pre-codition ***
    ...      - เวลาในการทำ : 30 นาที
    ...      - web: https://aisplay.ais.co.th/portal/  
    ...    ==> 
    ...    *** Recommended Keywords ***
    ...      - แนะนำ Keyword ที่ใช้
    ...          1. Get Text                           ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...          2. Wait For Elements State            ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...          3. Fill Text                          ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...          4. Click                              ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...          5. Take Screenshot (จะใช้หรือไม่ใช้ก็ได้)   ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...          6. Log            (จะใช้หรือไม่ใช้ก็ได้)    ---> https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
    ...    ==>
    ...    *** Test Step ***
    ...      1. เปิดเว็บ
    ...      2. [1] ค้นหา "เรื่องอะไรก็ได้ เช่น ดรีมทีม"                                          
    ...    ==>
    ...    *** Expect Result ***
    ...      [1] Verify Results Search 
    ...          ---> จะต้องมี Text "Results for:" และ "คำที่ค้นหา" 
    ...          ("คำที่ค้นหา" จะต้องตรงกับคำที่ใช้ Search ในตอนแรก)
    ...    ==>
    [Tags]     03
    Open Web Ais Play Production
    Search On Aisplay Top Header Bar    ${search_name} 
    Wait For Elements State     //div[@class="container-fluid bg-block py-3 px-3 px-md-5 text-wrap"]    visible
    Take Screenshot      fullPage=${True}
    ${Resultsfor}        Get Text        //h1[@class="default-title mb-3"]/span[1]
    Log     \n${Resultsfor}     console=true
    Should Be Equal As Strings      ${Resultsfor}     ${msg_header_result_search}
    ${resultsearch}        Get Text        //h1[@class="default-title mb-3"]/span[2]
    Log     \n${resultsearch}     console=true
    Should Be Equal As Strings      ${resultsearch}     ${search_name} 
    ${AllResult}=   Catenate    ${Resultsfor}   ${resultsearch}
    Log     \n${AllResult}     console=true

    

Answer_Medium_Day2 : Problem 4 - Verify Value Number Phone Is Integer (RegEx / Remove String) 
    [Documentation]    Owner: Patipan.w
    ...    *** Pre-codition ***
    ...      - เวลาในการทำ : 30 นาที
    ...      - web: https://aisplay.ais.co.th/portal/  
    ...    ==> 
    ...    *** Recommended Keywords ***
    ...      - แนะนำ Keyword ที่ใช้
    ...          1. Should Match Regexp                         ---> https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
    ...          2. Remove String                               ---> https://robotframework.org/robotframework/latest/libraries/String.html
    ...          3. Get Length                                  ---> https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
    ...          4. Set Variable                                ---> https://robotframework.org/robotframework/latest/libraries/BuiltIn.html 
    ...          5. Should Be Equal As Strings (จะใช้หรือไม่ใช้ก็ได้) ---> https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
    ...          5. Take Screenshot            (จะใช้หรือไม่ใช้ก็ได้) ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...          6. Log                        (จะใช้หรือไม่ใช้ก็ได้) ---> https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
    ...    ==> 
    ...    *** Condition ***
    ...      - ใช้ Regular Expression" ในการดัก Pattern "XXX-XXX-XXXX"
    ...    ==>
    ...    *** Test Step ***
    ...      1. [1] Set Variable เป็น เลขอะไรก็ได้ เช่น เบอร์โทร 080-222-1111 หรือเลขอะไรก็ได้  "XXX-XXX-XXXX"                              
    ...    ==>
    ...    *** Expect Result ***
    ...      [1] นำค่าที่ Set Variable มาเช็ค Formet ว่าจะต้องเป็น Formet "XXX-XXX-XXXX" และเป็น "ตัวเลข" จากนั้นแปลงเป็น Formet "XXXXXXXXXX" 
    ...    และจะต้องเป็น "ตัวเลขจำนวน 10 หลัก"
    ...    ==>
    [Tags]     04
    ${Phone1}   Set Variable    080-222-1111
    Should Match Regexp    ${Phone1}    ^[0-9]{3}-[0-9]{3}-[0-9]{4}$
    ${Phone2} =	Remove String	${Phone1}	    -
    ${Phone3}    Get Length    ${Phone2}
    Log     \n${Phone3}   console=yes
    Should Be Equal As Strings    ${Phone3}    10



