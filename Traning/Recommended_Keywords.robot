*** Settings ***
Library      String
Library      Collections
Library      BuiltIn
*** Keywords ***
1. Wait For Elements State
    [Documentation]    Owner: Patipan.w    
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...    - เป็น คำสั่งที่ใช้ในการรอให้ "${selector}" กระทำ "${state}" นั้นๆที่ระบุไปให้เสร็จก่อนบนหน้าเว็บ ก่อนที่จะดำเนินการต่อไปในขั้นตอนถัดไป
    ...     คำสั่งนี้จะหยุดรอเมื่อ "${selector}" ปรากฏขึ้นหรือมีการแสดงผลบนหน้าเว็บ หากหมดเวลา ${timeout} ที่กำหนดแล้ว
    ...     แต่ "${selector}" ยัง ไม่กระทำ "${state}" นั้นๆที่ระบุไป การทำงานของคำสั่งจะถูกยกเลิกและจะเกิดข้อผิดพลาด หรือ "Fail".
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${selector} (Mandatory) = ระบุ "locator" หรือ (Xpath) ของ (Elements)
    ...    2. ${state} (Mandatory) = ระบุ "action"เช่น 
    ...           - visible เป็น "state" คำสั่งที่ใช้ในการรอให้ (Elements) ปรากฏขึ้นหรือแสดงผลบนหน้าเว็บก่อนที่จะดำเนินการต่อไปในขั้นตอนถัดไป
    ...           - hidden  เป็น "state" คำสั่งที่ใช้ในการรอให้ (Elements) ไม่ปรากฏขึ้นหรือไม่แสดงผลบนหน้าเว็บก่อนที่จะดำเนินการต่อไปในขั้นตอนถัดไป        
    ...           - enabled เป็น "state" คำสั่งที่ใช้ในการรอให้ (Elements) จะต้องเป็น state "ebable" ก่อนที่จะดำเนินการต่อไปในขั้นตอนถัดไป
    ...           - disabled เป็น "state" คำสั่งที่ใช้ในการรอให้ (Elements) จะต้องเป็น state "disable" ก่อนที่จะดำเนินการต่อไปในขั้นตอนถัดไป
    ...    3. ${timeout} (Optional) = ระบุเวลาที่ต้องการให้รอจนกว่าจะหมด "timeout" เช่น 10s, 20s หากไม่ระบุจะถูก "(Default)" ไว้ที่ "6s".
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน 
    # Ex1
    Wait For Elements State  //h1[@button="ok"]   visible   15s

    # Ex2 - หากติด "iFrame" ให้ระบุ Arrow เพื่อให้ Robot ชี้จุดเข้าไปที่ "iFrame" นั้นๆ
    Wait For Elements State    id=iFrame >>> //h1[@button="ok"]   visible   15s

2. Click
    [Documentation]    Owner: Patipan.w        
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...    - เป็นคำสั่งที่ใช้ในการ "Click" ใน (Elements) ของหน้าเว็บ เช่น ปุ่ม ลิงก์ หรือ ฟิลด์ข้อมูลที่สามารถคลิกได้.
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${selector} (Mandatory) = ระบุ "locator" หรือ (Xpath) ของ (Elements)
    ...    2. ${button} (Optional) = ระบุ "mouseButton"เช่น "Click ซ้าย" หรือ "Click ขวา" หากไม่ได้ระบุจะถูก "(Default)" ไว้ที่ "left".
    ...           - left เป็น "Click ซ้าย" 
    ...           - right เป็น "Click ขวา"    
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน 
    # Click ซ้าย 
    Click    //h1[@button="ok"]
    # Click ขวา 
    Click   //h1[@button="ok"]    right
    # Ex - หากติด "iFrame" ให้ระบุ Arrow เพื่อให้ Robot ชี้จุดเข้าไปที่ "iFrame" นั้นๆ
    Click    id=iFrame >>> //h1[@button="ok"]

3. Get Text
    [Documentation]    Owner: Patipan.w    
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...    - เป็นคำสั่งที่ใช้ในการเรียกดู "ข้อความที่ปรากฏบนหน้าเว็บ" หรือ (Elements) แล้วคืนค่าข้อความนั้น เพื่อนำไปใช้งานหรือตรวจสอบในขั้นตอนถัดไปของการทดสอบ.
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${selector} (Mandatory) = ระบุ "locator" หรือ (Xpath) ของ (Elements)
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน 
    ${result_text}    Get Text    //h1[@class="text"]
    Log    ${result_text} == Attack On Titan

    # Ex - หากติด "iFrame" ให้ระบุ Arrow เพื่อให้ Robot ชี้จุดเข้าไปที่ "iFrame" นั้นๆ
    ${result_text}    Get Text    id=iFrame >>> //h1[@class="text"]

4. Fill Text
    [Documentation]    Owner: Patipan.w    
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...    - เป็นคำสั่งที่ใช้ในการใส่ข้อความลงในส่วนของ ข้อมูลของ (Elements) ต่าง ๆ ในหน้าเว็บหรือแอปพลิเคชันที่กำลังทดสอบ 
    ...    หากต้องการป้อนข้อความในช่องข้อมูลใด ๆ เช่น ช่องค้นหาหรือช่องใส่ข้อความอื่น ๆ ในหน้าเว็บหรือแอปพลิเคชัน ผู้ใช้งานสามารถใช้คำสั่ง Fill Text
    ...     เพื่อใส่ข้อความลงใน (Elements) นั้น ๆ โดยระบุตำแหน่งของ (Elements) ที่ต้องการใส่ข้อความและระบุข้อความที่ต้องการใส่
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${selector} (Mandatory) = ระบุ "locator" หรือ (Xpath) ของ (Elements)
    ...    2. ${txt}    (Mandatory) = ระบุ String ที่ต้องการใส่ข้อความ
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน 
    # กรอก ชื่อจริง
    Fill Text    //input[@class="name"]    Attack On Titan

    # Ex - หากติด "iFrame" ให้ระบุ Arrow เพื่อให้ Robot ชี้จุดเข้าไปที่ "iFrame" นั้นๆ
    Fill Text     id=iFrame >>> //input[@class="name"]         Attack On Titan

5. Get Elements
    [Documentation]    Owner: Patipan.w    
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...    - เป็นคำสั่งที่ใช้ในการดึงข้อมูลหรือคุณสมบัติขององค์ประกอบ (element) บนหน้าเว็บ เช่น ตำแหน่ง, ขนาด, คลาส, หรือแอตทริบิวต์อื่น ๆ ของ element นั้น ๆ 
    ...    และคืนค่าให้กับตัวแปรเพื่อนำไปใช้งานต่อไป (จะคืนค่าเป็นตัวแปรประเภท WebElement ซึ่งเป็นอ็อบเจ็กต์ที่ใช้ในการแทรกตัวแปรในการเข้าถึงคุณสมบัติและดำเนินการกับ element นั้น ๆ บนหน้าเว็บไซต์)
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${selector} (Mandatory) = ระบุ "locator" หรือ (Xpath) ของ (Elements)
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน 
    ${elements}    Get Elements    //div[@class="list_profile"]/a
    Log Many    ${elements}     # == ['element=fbb4917b-7307-41c6-9b8b-3c99027bb10c', 'element=fd39b76e-b40b-4f48-9f47-c8eee77210e3', 'element=d4505ce4-a2f0-467b-bc75-19076192693f']

6. Get Length
    [Documentation]    Owner: Patipan.w    
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
    ...    - เป็นคำสั่งที่ใช้ในการหา "ความยาว" หรือ "จำนวนสมาชิก" ในรายการหรือลิสต์ (list) หรือข้อความ (String) ที่กำหนดให้ 
    ...    โดยจะคืนค่าเป็นจำนวนเต็มที่แสดงถึงจำนวนสมาชิกในรายการหรือความยาวของข้อความนั้น ๆ
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${item} (Mandatory) = ระบุ "string" หรือ "list"
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน 
    ${length}    Get Length    0903921231
    Log    ${length}     # == 10

7. Remove String
    [Documentation]    Owner: Patipan.w  
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://robotframework.org/robotframework/latest/libraries/String.html
    ...    - เป็นคำสั่งที่ใช้ในการลบ (String) ที่กำหนด
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${string} (Mandatory) = ระบุ "string"
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน 
    ${name}    Set Variable    (Attack On Titan SS 1 Episode 3)
    # Ex1
    ${result}    Remove String    ${name}    ${SPACE}    (    )
    Log    ${result_ex1}     # == AttackOnTitanSS1Episode3
    # Ex2
    ${result}    Remove String    ${name}    (    )    Episode 3
    Log    ${result_ex2}     # == Attack On Titan SS 1 

8. Split String
    [Documentation]    Owner: Patipan.w 
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://robotframework.org/robotframework/latest/libraries/String.html
    ...    - เป็นคำสั่งที่ใช้ใน  การแบ่ง (String) ออกเป็นส่วนย่อยตามตัวคั่นที่กำหนด และคืนค่าเป็นลิสต์ (list) ของสตริงย่อยที่แยกออกมา
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${string} (Mandatory) = ระบุ (String)
    ...    2. ${separator} (Mandatory) = ระบุว่าต้องการคั่นด้วยอะไร ถ้าหากไม่ระบุจะถูก "default" ไว้ที่ "${SPACE}"
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน 
    ${name}    Set Variable    Attack On Titan SS 1 Episode 3
    # Ex1
    @{result_ex1}    Split String    ${name}
    Log    ${result_ex1}        # = ['Attack','On','Titan','SS','1','Episode','3']
    Log    ${result_ex1}[0]     # = 'Attack'
    Log    ${result_ex1}[1]     # = 'On'
    Log    ${result_ex1}[2]     # = 'Titan'
    Log    ${result_ex1}[3]     # = 'SS'
    Log    ${result_ex1}[4]     # = '1'
    Log    ${result_ex1}[5]     # = 'Episode'
    Log    ${result_ex1}[6]     # = '3'

    # Ex2
    @{result_ex2}    Split String    ${name}    SS 1
    Log    ${result_ex2}        # = ['Attack On Titan ', ' Episode 3']
    Log    ${result_ex2}[0]     # = 'Attack On Titan '
    Log    ${result_ex2}[1]     # = ' Episode 3'

9. Catenate
    [Documentation]    Owner: Patipan.w   
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
    ...    - เป็นคำสั่งที่ใช้ใน รวม (String) แล้วคืนค่ากลับเป็น (String)
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${item} (Mandatory) = ระบุ "string" หรือ "list"
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน 
    ${name}       Set Variable    Patipan
    ${surname}    Set Variable    Wachirakamchai

    # Ex1
    ${result}     Catenate
    ...    ${\n}Name: ${name} 
    ...    ${\n}Surname: ${surname}
    Log    ${result}        console=yes
    # = Name: Patipan
    # = Surname: Wachirakamchai

    # Ex2
    ${result}     Catenate    ${name}  ${surname}
    Log      ${result}      # = Patipan Wachirakamchai

10. Evaluate
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
    ...    - เป็นคำสั่งที่ใช้ในการ "ประเมิน" และ "คำนวณสูตร" หรือ "นิพจน์ทางคณิตศาสตร์" หรือ "ลอจิก" ในรูปแบบของ (String) และคืนค่าผลลัพธ์กลับมาให้ในรูปแบบที่เหมาะสม
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${expression} (Mandatory) = ระบุ  "สูตรคำนวณ" หรือ "ลอจิก"
    ...    2. ${modules} (Optional) = ระบุ modules คือ "json" หรือ "selenium.webdriver"
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน 
    # Ex1
    ${result}   Evaluate    (2 + 3) * 5
    Log    ${result}     # == 25    เป็นประเภท "Integer"

    # Ex2
    ${location_sign_pad_width}     Set Variable    1280
    ${location_sign_pad_height}    Set Variable    500
    ${location_sign_pad_x}         Set Variable    200
    ${location_sign_pad_y}         Set Variable    100
    ${start_write_x}   Evaluate    int((${location_sign_pad_width}/3)+${location_sign_pad_x})
    ${start_write_y}   Evaluate    int((${location_sign_pad_height}/2)+${location_sign_pad_y})
    ${end_write_x}     Evaluate    int(${start_write_x}*2)
    Log    ${start_write_x}     # == 626.66      เป็นประเภท "Integer"
    Log    ${start_write_y}     # == 350         เป็นประเภท "Integer"
    Log    ${end_write_x}       # == 61879.98    เป็นประเภท "Integer" 

11. Run Keyword And Return Status
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
    ...    - เป็นคำสั่งที่ใช้ในการเรียก ใช้คีย์เวิร์ดหรือคำสั่งอื่น ๆ และคืนค่าสถานะการทำงานกลับมา ซึ่งจะเป็น True หรือ False ตามผลลัพธ์ของคำสั่งที่ถูกเรียกใช้
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${name_keyword} (Mandatory) = ระบุ  "Keyword" หรือ คำสั่งอื่นๆ
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน 
    # Ex1
    ${status}    Run Keyword And Return Status    Should Be Ture    2 == 5
    Log   ${status}     # == ${False}

    # Ex2
    ${status}    Run Keyword And Return Status    Should Be Ture    2 == 2
    Log   ${status}     # == ${True}

12. Set Variable
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
    ...    - เป็นคำสั่งที่ใช้ในการกำหนดค่าให้กับตัวแปร (variables) ในขณะที่ทำงานในไฟล์ทดสอบ (test file) หรือไฟล์ทรัพยากร (resource file)
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${values} (Mandatory) = ระบุค่าที่ต้องการ set (variables)
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน 
    ${username}     Set Variable    Patipan.w
    Log    ${username}     # == Patipan.w

13. Set Variable If
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
    ...    - เป็นคำสั่งที่ใช้ในการกำหนดค่าให้กับตัวแปร (variables) 
    ...    โดยขึ้นอยู่กับเงื่อนไขที่กำหนด หากเงื่อนไขเป็นจริง (True) ค่าที่กำหนดจะถูกใช้ แต่หากเงื่อนไขเป็นเท็จ (False) ค่าตัวแปรจะไม่เปลี่ยนแปลง
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${condition} (Mandatory) = ระบุ condition ที่จะต้องการ set (variables)
    ...    2. ${values} (Mandatory) = ระบุค่าที่ต้องการ set (variables)
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน
    ${username}     Set Variable    Nine
    ${role_qa}      Set Variable    Software Tester
    ${role_dev}     Set Variable    Software Engineer
    ${role_sa}      Set Variable    System Analyst
    ${role}      Set Variable If   
    ...  "${username}" == "Nine"    "${role_qa}"  
    ...  "${username}" == "Chain"   "${role_qa}"
    ...  "${username}" == "M"       "${role_dev}"
    ...  "${username}" == "Nut"     "${role_qa}"   
    ...  "${username}" == "Nanew"   "${role_qa}"
    ...  "${username}" == "June"    "${role_sa}"
    Log    Username: "${username}" , Role:  "${role}"     # == Username: "Nine" , Role: "Software Tester"

14. Set Test Variable
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
    ...    -  เป็นคำสั่งที่ใช้ในการกำหนดค่าให้กับตัวแปร (variables) ในช่วงเทสเคส (test case) เฉพาะเท่านั้น โดยค่าตัวแปรจะมีผลและใช้ได้เฉพาะในเทสเคสที่กำหนด
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${values} (Mandatory) = ระบุค่าที่ต้องการ set (variables)
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน
    ${role_qa}      Set Variable    Software Tester
    Set Test Variable    ${ROLE}    ${role_qa}
    Log    ${ROLE}    # == Software Tester

15. Should Match Regexp
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
    ...    -  ป็นคีย์เวิร์ดที่ใช้ในการตรวจสอบว่าสตริงตรงตามรูปแบบของพิมพ์ที่กำหนดโดยใช้ Regular Expression (Regex) หรือไม่ 
    ...    และคืนค่าผลลัพธ์เป็น True หรือ False ซึ่งแสดงถึงการตรงตามหรือไม่ตรงตามรูปแบบที่กำหนด
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${string} (Mandatory) =  (String) ที่ต้องการตรวจสอบ
    ...    2. ${pattern} (Mandatory) = รูปแบบของพิมพ์ที่ต้องการตรวจสอบด้วย Regular Expression
    ...    3. ${msg} (Optional) = ข้อความที่เพิ่มเติมที่จะแสดงเมื่อการตรวจสอบไม่ผ่าน
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน
    ${email}    Set Variable    090-XXX-2021
    Should Match Regexp    ${email}    .+    msg=Invalid phone number format

16. Should Be Equal As Strings
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
    ...    -  เป็นคีย์เวิร์ดที่ใช้ในการตรวจสอบว่าสตริงเหมือนกันหรือไม่ 
    ...    โดยเปรียบเทียบตามค่าตัวอักษรของสตริงแทนที่จะเปรียบเทียบตามค่าตัวแปรเชิงตัวเลข
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${string1} (Mandatory) = สตริงที่ต้องการเปรียบเทียบ
    ...    2. ${string2} (Mandatory) = สตริงที่ต้องการเปรียบเทียบ
    ...    3. ${msg} (Optional) = ข้อความเพิ่มเติมที่จะแสดงเมื่อการเปรียบเทียบไม่ผ่าน
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน
    ${string1}    Set Variable    Kachain.a
    ${string2}    Set Variable    Kachain.a
    Should Be Equal As Strings    ${string1}    ${string2}    msg=The strings are not equal

17. Should Be Equal
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
    ...    -  เป็นคีย์เวิร์ดที่ใช้ในการตรวจสอบว่าค่าของสองตัวแปรหรือค่าคงที่เหมือนกันหรือไม่ 
    ...    โดยเปรียบเทียบค่าตรงกันเป๊ะทั้งตัวอักษรและประเภทของข้อมูล
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${value1} (Mandatory) = ค่าที่ต้องการเปรียบเทียบ
    ...    2. ${value2} (Mandatory) = ค่าที่ต้องการเปรียบเทียบ
    ...    3. ${msg} (Optional) = ข้อความที่เพิ่มเติมที่จะแสดงเมื่อการเปรียบเทียบไม่ผ่าน
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน
    ${value1}    Set Variable    10
    ${value2}    Set Variable    10
    Should Be Equal    ${value1}    ${value2}    msg=The values are not equal

18. Should Be Ture
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
    ...    -  เป็นคีย์เวิร์ดที่ใช้ในการตรวจสอบว่าค่าของตัวแปรหรือค่าคงที่เป็นจริง (True) หรือไม่ และคืนค่าผลลัพธ์เป็น True หรือ False 
    ...    ซึ่งแสดงถึงความเป็นจริงหรือไม่เป็นจริงของค่าที่ต้องการตรวจสอบ
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${condition} (Mandatory) = เงื่อนไขที่ต้องการตรวจสอบว่าเป็นจริง (True)
    ...    2. ${msg} (Optional) = ข้อความที่เพิ่มเติมที่จะแสดงเมื่อการเปรียบเทียบไม่ผ่าน
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน
    ${value1}    Set Variable    10
    ${value2}    Set Variable    8
    Should Be True    ${value1} !=    ${value2}        msg=The condition is not true

19. Take Screenshot
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...    -  เป็นคำสั่งที่ใช้ในการ "Capture Screen" บน "Browser"
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${filename} (Optional) = ชื่อรูป "Screenshot"
    ...    2. ${fileType} (Optional) = สกุลไฟล์ "Screenshot"
    ...    3. ${fullPage} (Optional) = ถ้าต้องการ "Full Screenshot" กำหนดเป็น ${True} แต่ถ้าไม่จะ "(Default)" เป็น ${False}
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน
    # Ex1
    Take Screenshot

    # Ex2
    Take Screenshot    HomePage    fileType=png    fullPage=${True}
    
20. Scroll By
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...    -  เป็นคำสั่งที่ใช้ในการ สำหรับเลื่อนหน้าเว็บไปทางทิศทางแนวตั้ง (vertical direction) หรือแนวนอน (horizontal direction) ด้วยระยะที่กำหนด
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${selector} (Optional) = จะเป็น "(Default)" = หาก ${NONE} หรือ ${Empty} จะเป็นการ scroll full page ตามขนาดหน้าจอ "ปัจจุบัน", 
    ...        - ระบุ ${selector} หากต้องการ scroll on element.
    ...    2. ${vertical} (Mandatory) = ระบุ (direction) "แนวตั้ง" ที่ต้องการให้ scroll ตาม ระยะของ (direction) นั้นๆ บน Display
    ...    3. ${horizontal} (Mandatory) = ระบุ (direction) "แนวนอน" ที่ต้องการให้ scroll ตาม ระยะของ (direction) นั้นๆ บน Display
    ...    4. ${behavior} (Optional) = คือ สถานการณ์ทดสอบ หรือ การทำงานของระบบ จะถูก "(Default)" เป็น "auto"
    ...    ตัวอย่างการ set เช่น ระบุ "behavior=smooth" จะทำให้การ scroll ดู "smooth" และเป็นธรรมชาติมากขึ้น ต่างจากค่า "(Default)" ที่เป็น "auto"
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน
    # Ex1 - scroll on element.
    Scroll By    selector=//div[@class="pnl_list_menu"]   vertical=50%    horizontal=50%

    # Ex2 - scroll full page.
    Scroll By    selector=${None}    vertical=100%    horizontal=0    behavior=smooth

    # Ex3 - scroll full page.
    Scroll By    200px    0   

21. Scroll To
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...    -  เป็นคำสั่งที่ใช้ในการ สำหรับเลื่อนหน้าเว็บไปยังตำแหน่งที่กำหนดให้ โดยใช้ค่าตำแหน่งแนวตั้ง (vertical position) หรือค่าตำแหน่งแนวนอน (horizontal position) 
    ...    เพื่อเลื่อนไปยังส่วนที่ต้องการ ในมุมมองหน้าเว็บ
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${selector} (Optional) = จะเป็น "(Default)" = หาก ${NONE} หรือ ${Empty} จะเป็นการ scroll full page ตามขนาดหน้าจอ "ปัจจุบัน", 
    ...        - ระบุ ${selector} หากต้องการ scroll on element.
    ...    2. ${vertical} (Mandatory) = ระบุ (position) "แนวตั้ง" ที่ต้องการให้ scroll ไป (position) นั้นๆ
    ...    3. ${horizontal} (Mandatory) = ระบุ (position) "แนวนอน" ที่ต้องการให้ scroll ไป (position) นั้นๆ
    ...    4. ${behavior} (Optional) = คือ สถานการณ์ทดสอบ หรือ การทำงานของระบบ จะถูก "(Default)" เป็น "auto"
    ...    ตัวอย่างการ set เช่น ระบุ "behavior=smooth" จะทำให้การ scroll ดู "smooth" และเป็นธรรมชาติมากขึ้น ต่างจากค่า "(Default)" ที่เป็น "auto"
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน
    # Ex1 - scroll on element.
    Scroll To    selector=//div[@class="pnl_list_menu"]   vertical=50%    horizontal=50%

    # Ex2 - scroll full page.
    Scroll To    selector=${Empty}    vertical=100%    horizontal=0    behavior=smooth

22. Scroll To Element
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...    -  เป็นคำสั่งที่ใช้ในการ เลื่อนหน้าเว็บไปหา (Elements) หรือ "ส่วนที่ต้องการ" ที่อยู่ในมุมมองที่ "มองเห็น" ในหน้าเว็บ
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${selector} (Mandatory) = ระบุ "locator" หรือ (Xpath) ของ (Elements)
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน
    # Ex1
    Scroll To Element    selector=//div[@class="pnl_list_menu"]

23. Press Keys
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...    -  เป็นคำสั่งที่ใช้ในการ "กด" (Elements) ที่ระบุ และ "ปล่อย" (Elements) ที่ระบุ บนแป้นพิมพ์ (Keybord) ในเบราว์เซอร์ที่กำหนด
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${selector} (Mandatory) = ระบุ "locator" หรือ (Xpath) ของ (Elements)
    ...    2. ${key} (Mandatory) = ระบุ "event.code", "event.which", หรือ "event.key" ที่ต้องการทำ "Action" กับ (Elements) นั้นๆ
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน
    # Ex1
    Press Keys    selector=//div[@button="play/pause"]    Space

    # Ex2
    [Arguments]    ${locator}    ${keycode}    ${times}=1
    FOR    ${index}    IN RANGE      ${times}
        Log                ${keycode}
        IF    '${keycode}' == 'Space'       Press Keys    ${locator}    Space
        ...    ELSE IF    '${keycode}' == 'Tab'         Press Keys    ${locator}    Tab
        ...    ELSE IF    '${keycode}' == 'Backspace'   Press Keys    ${locator}    Backspace
        ...    ELSE IF    '${keycode}' == 'Enter'       Press Keys    ${locator}    Enter	
        ...    ELSE IF    '${keycode}' == 'Escape'      Press Keys    ${locator}    Escape
        ...    ELSE IF    '${keycode}' == 'ArrowLeft'   Press Keys    ${locator}    ArrowLeft
        ...    ELSE IF    '${keycode}' == 'ArrowUp'     Press Keys    ${locator}    ArrowUp
        ...    ELSE IF    '${keycode}' == 'ArrowRight'  Press Keys    ${locator}    ArrowRight
        ...    ELSE IF    '${keycode}' == 'ArrowDown'   Press Keys    ${locator}    ArrowDown
        ...    ELSE    Fail    No '${keycode}'
    END 

24. Keyboard Key
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...     -  เป็นคำสั่งที่ใช้ในการ "กด" และ "ปล่อย" บนแป้นพิมพ์ (Keybord) ในเบราว์เซอร์ที่กำหนด
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${action} (Mandatory) = ระบุ "action" เช่น ต้องการให้ กด(press) ระบุ "press", ต้องการให้กดค้าง(hold) ระบุ "down"
    ...    2. ${key} (Mandatory) = ระบุ "event.code", "event.which", หรือ "event.key" ที่ต้องการทำ "Action" กับ (Elements) นั้นๆ
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน
    # Ex1
    Keyboard Key    press    Enter

    # Ex2
    [Arguments]       ${action}     ${keycode}    ${times}=1    
    FOR    ${index}    IN RANGE     ${times}
        Log                ${keycode}
        IF    '${keycode}' == 'Space'            Keyboard Key    ${action}    Space
        ...    ELSE IF    '${keycode}' == 'Tab'              Keyboard Key    ${action}    Tab
        ...    ELSE IF    '${keycode}' == 'Backspace'        Keyboard Key    ${action}    Backspace
        ...    ELSE IF    '${keycode}' == 'Enter'            Keyboard Key    ${action}    Enter	
        ...    ELSE IF    '${keycode}' == 'Escape'           Keyboard Key    ${action}    Escape
        ...    ELSE IF    '${keycode}' == 'ArrowLeft'        Keyboard Key    ${action}    ArrowLeft
        ...    ELSE IF    '${keycode}' == 'ArrowUp'          Keyboard Key    ${action}    ArrowUp
        ...    ELSE IF    '${keycode}' == 'ArrowRight'       Keyboard Key    ${action}    ArrowRight
        ...    ELSE IF    '${keycode}' == 'ArrowDown'        Keyboard Key    ${action}    ArrowDown
        ...    ELSE IF    '${keycode}' == 'BrowserRefresh'   Keyboard Key    ${action}    BrowserRefresh
        ...    ELSE    Fail    No '${keycode}'
    END

25. New Browser
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...     -  เป็นคำสั่งที่ใช้สำหรับ "สร้าง" และ "เปิดหน้าต่างเบราว์เซอร์ใหม่"
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${browser} (Optional) = จะเป็น "(Default)" = chromium (engine=Google Chrome, Microsoft Edge (since 2020), Opera)
    ...    - หากต้องการเปิด Firefox ให้ระบุ "firefox" , 
    ...    - หากต้องการเปิด Safari ให้ระบุ "webkit"
    ...    2. ${headless} (Optional) = จะเป็น "(Default)" = "${True}" คือ Run แบบไม่แสดงหน้าต่าง Browser
    ...    - หากต้องการ  Run แบบแสดงหน้าต่าง Browser ให้ระบุ "${False}"
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน
    # Ex1
    New Browser
    ...    browser=Firefox
    ...    headless=${False}

    # ใช้งานร่วมกับ "New Context"
    ${id_context}    New Context
    ...    acceptDownloads=${TRUE}
    ...    ignoreHTTPSErrors=${FALSE}
    ...    viewport={'width': 1366, 'height': 768}
    ...    permissions=['camera', 'microphone']
    # ใช้งานร่วมกับ "New Page"
    New Page    https://www.google.com/

26. New Context
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...     -  เป็นคำสั่งที่ใช้สำหรับ "สร้าง" และ "เปิดเครื่องมือออกแบบเว็บ (Web tool)" ที่ต้องการเปิดใช้งาน บน "เบราว์เซอร์"
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${ignoreHTTPSErrors} (Optional) = ระบุให้เบราว์เซอร์ทำการเพิกเฉยต่อ "ข้อผิดพลาดที่เกิดขึ้นในการตรวจสอบความปลอดภัยของเว็บไซต์ที่ใช้ HTTPS" หรือไม่?
    ...    - หากต้องการให้ระบุ "${TRUE}", หากไม่ต้องการให้ระบุ "${FALSE}"
    ...    2. ${acceptDownloads} (Optional) = ใช้สำหรับกำหนดว่าเบราว์เซอร์ควรยอมรับ "การดาวน์โหลดไฟล์อัตโนมัติ" หรือไม่?
    ...    - หากต้องการให้ระบุ "${TRUE}", หากไม่ต้องการให้ระบุ "${FALSE}"
    ...    3. ${viewport}    (Optional) = กำหนด "ขนาด" และ "ความกว้าง" , "ความสูง" ของ "เว็บเบราว์เซอร์" จะแสดงขนาด "เว็บเบราว์เซอร์" ตามที่กำหนดค่ามา
    ...    - เช่น  {'width': 1366, 'height': 768} ประมาณขนาดหน้าจอ 13 นิ้ว
    ...    4. ${permissions}    (Optional) =  เป็นการ "กำหนดสิทธิ์" ในเว็บบราวเซอร์  เช่น
    ...    -    ต้องการให้เปิด "กล้องถ่ายรูป" บน "เว็บเบราว์เซอร์" ให้ระบุ "camera"
    ...    -    ต้องการให้เปิด "ไมค์โฟน" บน "เว็บเบราว์เซอร์" ให้ระบุ "microphone"
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน
    ${id_context}    New Context
    ...    acceptDownloads=${TRUE}
    ...    ignoreHTTPSErrors=${FALSE}
    ...    viewport={'width': 1366, 'height': 768}

27. New Page
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...     -  เป็นคำสั่งที่ใช้สำหรับ เปิดหน้า "เว็บเบราว์เซอร์" ตาม "URL" ที่กำหนด
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${url} (Mandatory) =  ค่าเป็น "URL" ของหน้าเว็บที่ต้องการเปิดในหน้าใหม่
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน
    New Page    https://www.google.com/

28. Switch Browser
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...     -  เป็นคำสั่งที่ใช้สำหรับ "สลับ" การควบคุมระหว่าง "หน้าต่างเบราว์เซอร์" ที่กำหนด
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${id} (Mandatory) =  ระบุ ${id_context} 
    ...    - ในตอนที่ใช้ New Context จะมีการ gen "id_context" เพื่อระบุ "id" ให้กับ "Browser" นั้นๆที่เปิดไว้ให้เป็นค่าที่ (Unique)
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน
    New Page    https://www.google.com/

29. Create List
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
    ...     -  เป็นคำสั่งที่ใช้สำหรับ "สร้างรายการข้อมูล" แบบลำดับ (list) ใหม่ 
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${items} (Mandatory) =  ระบุ (String)
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน
    # Ex1
    @{list_menu}     Create List    Menu Home    Menu Setting    Menu Serach
    Log Many     ${list_menu}    # ['Menu Home','Menu Setting','Menu Serach']

    # Ex2 ใช้งานคู่กับ "Append To List"
    @{list_menu}     Create List    Menu Home    Menu Setting    Menu Serach
    @{list}          Create List    #  @{list} = "${Empty}" หรือ "${None}"
    FOR  ${i}  IN  @{list_menu}
        Append To List    ${list}    ${i}
    END
    Log Many    ${list}    # ['Menu Home','Menu Setting','Menu Serach']
    
30. Append To List
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://robotframework.org/robotframework/latest/libraries/Collections.html
    ...     -  เป็นคำสั่งที่ใช้สำหรับ "เพื่อเพิ่มสมาชิก (item)"" ไปยังรายการข้อมูลแบบ "ลำดับ (list)" ที่กำหนด
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${list} (Mandatory) =  ระบุ (list)
    ...    2. ${values} (Mandatory) =  ระบุ (values) ที่ต้องการโยนเข้า (list)
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน
    # Ex1
    @{list}    Create List     #  @{list} = "${Empty}" หรือ "${None}
    Append To List    ${list}    One    
    Append To List    ${list}    Two
    Log Many          ${list}  # ['One','Two']

31. Sleep
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
    ...     -  ถูกใช้ "เพื่อหน่วงเวลา" หรือ "พักการทำงานของการทดสอบไว้เป็นเวลาที่กำหนด"
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${time} (Mandatory) =  ระบุ (Integer) เช่น 2 หรือ 2s จะเท่ากับ 2 วินาที
    ...    2. ${reason} (Optional) =  ระบุ (String) ใช้ระบุเหตุผลหรือคำอธิบายสำหรับการหน่วงเวลา 
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน
    # Ex1
    Sleep    5s

    # Ex2
    Sleep    5s    reason=Waiting for response

32. Log
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
    ...     -  ถูกใช้สำหรับ "เขียนข้อความ" หรือ "ข้อมูลลงในรายงาน" ของผลการรันทดสอบ
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${message} (Mandatory) =  คือ "ข้อความหรือข้อมูลที่ต้องการเขียนลงในรายงาน" (log), ให้ทำการระบุ (String)
    ...    2. ${level}   (Optional) =  คือ "ระดับของข้อความที่ต้องการเขียนลงในรายงาน" (log), ให้ทำการระบุ (String)  ซึ่งสามารถเลือกระดับได้แก่ 
    ...    -  "INFO" (Default), "WARN", "ERROR", หรือ "WARN ON ERROR" (เฉพาะกรณีที่เกิดข้อผิดพลาด จะทำงานคล้ายกับ Fail)
    ...    3. ${console} (Optional) =  คือ "ต้องการให้ (log) ใน (console) หรือไม่" 
    ...    -    หากต้องการให้ระบุ "yes" หรือ ${True}
    ...    -    หากไม่ต้องการจะถูก (Default) เป็น "no" หรือ ${False} อยู่แล้ว
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน
    # Ex1 - Log ใน File
    Log        This is an information message

    # Ex2 - Log ใน File และ ใน Console
    Log        This is an information message    console=${True}

    # Ex3 - Log ใน File และ ใน Console และจะติด "WARN" สีเหลือง
    Log        กรุณาระบุ Arg ให้ครบ    level=WARN    console=${True}

    # Ex4 - Log ใน File และ ใน Console และจะติด "Error" สีแดง
    Log        ไม่มี "ตารางข้อมูล"    level=ERROR    console=${True}

    # Ex5 - Log ใน File และ ใน Console และจะติด "Fail" สีแดง (เฉพาะกรณีที่เกิดข้อผิดพลาด จะทำงานคล้ายกับ Fail)
    ${status}    Run Keyword And Return Status    Should Be Ture    2 == 5
    IF    ${status} == ${False}    Log       *** ผลลัพธ์ไม่ถูกต้อง ***    level=WARN ON ERROR    console=${True}

33. Fail
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
    ...     -  ถูกใช้เพื่อสร้าง "ข้อผิดพลาด (failure)" ใน "การทำงานของทดสอบ" ทำการทดสอบ "Fail" และร "ายงานผลลัพธ์ว่าล้มเหลว"
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${msg} (Optional) =  คือ "ข้อความที่กำหนดว่าจะใช้ในการอธิบายหรือระบุเหตุผลที่การทดสอบล้มเหลว", ให้ทำการระบุ (String)
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน
    # Ex1 
    Fail        

    # Ex2 
    Fail        กรุณาระบุ Arg ให้ครบ

    # Ex3
    ${status}    Run Keyword And Return Status    Should Be Ture    2 == 5
    IF    ${status} == ${False}    Fail       ผลลัพธ์ไม่ถูกต้อง
    
34. Log Many
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://robotframework.org/robotframework/latest/libraries/BuiltIn.html
    ...     -  ถูกใช้เพื่อ "เขียนหลายข้อความหรือข้อมูลลงในรายงาน (log)" ของ "การรันทดสอบพร้อมกัน" 
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${message} (Mandatory) =  คือ "ลิสต์หรือรายการของข้อความหรือข้อมูลที่ต้องการเขียนลงในรายงาน (log) พร้อมกัน", ให้ทำการระบุ (List) หรือ (Dic) หรือ ข้อความ
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน
    # Ex1
    Log Many    This is message 1    This is message 2

    # Ex2
    @{list_menu}     Create List    Menu Home    Menu Setting    Menu Serach
    Log Many     ${list_menu}    # ['Menu Home','Menu Setting','Menu Serach']

35. Mouse Move Relative To
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...     -  ใช้สำหรับ "เคลื่อนที่ตำแหน่งของเมาส์จากตำแหน่ง(Elements)นึง ไปยังอีกตำแหน่งนึงตามที่ระบุค่าไว้" โดยใช้ค่าแกน "x" และ "y" ของขนาดหน้าจอ เป็นตัวระบุตำแหน่งสัมผัสแบบสัมพันธ์ (relative position)
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${selector} (Mandatory) =  ระบุ "locator" หรือ (Xpath) ของ (Elements) เพื่อใช้เป็น Start Point
    ...    2. ${x} (Mandatory) =  ตำแหน่ง "x" แนวนอน ของขนาดหน้าจอ "ค่าบวกจะเลื่อนไปทางขวา และค่าลบจะเลื่อนไปทางซ้าย"
    ...    3. ${y} (Mandatory) =  ตำแหน่ง "y" แนวตั้ง ของขนาดหน้าจอ "ค่าบวกจะเลื่อนลง และค่าลบจะเลื่อนขึ้น"
    ...    4. ${steps} (Optional) =  คือ ความไวของการลากเมาส์ 
    ...    - หากระบุ steps "มาก" เช่น 10 , 20 , 30 จะทำให้การเคลื่อนที่เมาส์เป็นไปอย่างราบรื่นและช้าลง และแม่นยำขึ้น
    ...    - หากระบุ steps "น้อย" เช่น 1 , 1.5 , 2 จะทำให้การเคลื่อนที่เมาส์เร็วขึ้น แต่ "อาจไม่มีความแม่นยำเท่ากับคำสั่งแรก"
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน
    # Ex1  เลื่อนเมาส์จาก (Elements) ไปด้านซ้าย 100 px
    Mouse Move Relative To    id=indicator    x=-100

    # Ex2  เลื่อนเมาส์จาก (Elements) ไปด้านขวา 100 px
    Mouse Move Relative To    id=indicator    x=100

    # Ex3  เลื่อนเมาส์จาก (Elements) ลงไปด้านล่าง 100 px
    Mouse Move Relative To    id=indicator    y=100

36. Get Url
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...     -  ใช้สำหรับดึง URL (Uniform Resource Locator) ปัจจุบันของหน้าเว็บที่เปิดอยู่ในเบราว์เซอร์
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน
    # Ex1 
    ${current_url}    Get URL
    Log    ${current_url}  console=yes    # https://www.youtube.com/

37. Get Title
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...     -  ใช้สำหรับดึงชื่อหัวเรื่อง (title) ของหน้าเว็บที่เปิดอยู่ในเบราว์เซอร์
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน
    # Ex1 
    ${title}    Get Title
    Log    ${title}  console=yes    # Entronica Home Page

38. Get Attribute
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...     -  ใช้สำหรับดึงค่าของแอตทริบิวต์ (attribute) ของ (Elements) ในหน้าเว็บที่เลือก
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${selector} (Mandatory) =  ระบุ "locator" หรือ (Xpath) ของ (Elements) เพื่อใช้เป็น Start Point
    ...    2. ${x} (Mandatory) =  ตำแหน่ง "x" แนวนอน ของขนาดหน้าจอ "ค่าบวกจะเลื่อนไปทางขวา และค่าลบจะเลื่อนไปทางซ้าย"
    ...    3. ${y} (Mandatory) =  ตำแหน่ง "y" แนวตั้ง ของขนาดหน้าจอ "ค่าบวกจะเลื่อนลง และค่าลบจะเลื่อนขึ้น"
    ...    4. ${steps} (Optional) =  คือ ความไวของการลากเมาส์ 
    ...    - หากระบุ steps "มาก" เช่น 10 , 20 , 30 จะทำให้การเคลื่อนที่เมาส์เป็นไปอย่างราบรื่นและช้าลง และแม่นยำขึ้น
    ...    - หากระบุ steps "น้อย" เช่น 1 , 1.5 , 2 จะทำให้การเคลื่อนที่เมาส์เร็วขึ้น แต่ "อาจไม่มีความแม่นยำเท่ากับคำสั่งแรก"
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน
    #Ex1
    ${value}    Get Attribute    class    //div[@class="Entronica"]
    Log     ${value}    # Entronica

    #Ex2
    ${value}    Get Attribute    type    //div[@class="OK" and @type="button"]
    Log     ${value}    # button

    # Ex - หากติด "iFrame" ให้ระบุ Arrow เพื่อให้ Robot ชี้จุดเข้าไปที่ "iFrame" นั้นๆ
    ${value}    Get Attribute    type    id=iFrame >>> //div[@class="OK" and @type="button"]

39. Get Property
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...     -  ใช้สำหรับดึงค่าของคุณสมบัติ (property) ของส่วนประกอบในหน้าเว็บที่เลือก
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${selector} (Mandatory) =  ระบุ "locator" หรือ (Xpath) ของ (Elements) เพื่อ "ดึงค่าคุณสมบัติ"
    ...    2. ${property} (Mandatory) =  ระบุชื่อ "คุณสมบัติ" ที่ต้องการดึงค่า เช่น "innerText", "innerHTML", "Value"
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน
    #Ex1
    ${property}   Get Property    //div[@class="OK" and @type="button" and text()="Entronica"]    innerText
    Log    ${property}    # Entronica

    # Ex - หากติด "iFrame" ให้ระบุ Arrow เพื่อให้ Robot ชี้จุดเข้าไปที่ "iFrame" นั้นๆ
    ${value}     Get Property    id=iFrame >>> //div[@class="OK" and @type="button" and text()="Entronica"]    innerText

40. Get BoundingBox
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...     -  ใช้สำหรับดึง "ขนาด" และ "ตำแหน่ง" ของ (Elements) ในหน้าเว็บที่เลือก
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${selector} (Mandatory) =  ระบุ "locator" หรือ (Xpath) ของ (Elements) เพื่อดึง "ขนาด" และ "ตำแหน่ง" ของ (Elements) 
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน
    #Ex1
    ${result}    Get BoundingBox    id=element
    Log    ${result}    # {'x': 559.09375, 'y': 75.5, 'width': 188.796875, 'height': 18}

    #Ex2
    ${result.x}    Get BoundingBox    id=element
    Log    ${result.x}    # x: 559.09375

    #Ex3
    ${result.y}    Get BoundingBox    id=element
    Log    ${result.y}    # y: 75.5

    # Ex - หากติด "iFrame" ให้ระบุ Arrow เพื่อให้ Robot ชี้จุดเข้าไปที่ "iFrame" นั้นๆ
    ${result}     Get BoundingBox    id=iFrame >>> id=element

41. Get Viewport Size
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...     -  ใช้สำหรับดึง "ขนาด" ของ "หน้าเว็บปัจจุบัน"
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน
    #Ex1
    ${view_point}    Get Viewport Size 
    Log    ${view_point}    # {'width':1280, 'height':720}

42. Go To
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...     -  ใช้สำหรับเปิด URL ในเบราว์เซอร์ ซึ่งจะทำให้เบราว์เซอร์เปลี่ยนไปยังหน้าเว็บที่ระบุ ตาม URL ที่เรากำหนด
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${url} (Mandatory) =  ระบุ URL (Uniform Resource Locator)
    ...    2. ${timeout} (Optional) =  (ไม่บังคับ) ระบุเวลาที่ต้องการ "รอจนกว่าเว็บจะโหลดเสร็จ" 
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน
    #Ex1
    Go To    https://www.youtube.com/

    #Ex2
    Go To    https://www.youtube.com/    timeout=60s

43. Go Back
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...     -  ใช้สำหรับการ "ย้อนกลับไปยังหน้าเว็บก่อนหน้านี้" ใน "ประวัติการเรียกใช้งานของเบราว์เซอร์" ซึ่งจะทำให้เบราว์เซอร์กลับไปยังหน้า "เว็บก่อนหน้านี้ที่ผู้ใช้เคยเข้าชม"
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน
    #Ex1
    Go Back

44. Hover
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...     -  ใช้สำหรับเลื่อนเมาส์ไปบน (Elements) ของหน้าเว็บ หรือ "วางเมาส์ค้างไว้บน (Elements)" โดยใช้ตำแหน่ง (Elements) เป็น (Parameter)
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${selector} (Mandatory) =  ระบุ "locator" หรือ (Xpath) ของ (Elements) เพื่อ "วางเมาส์ค้างไว้บน (Elements)"
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน
    #Ex1
    Hover    //button[@id='my-button']

    # Ex - หากติด "iFrame" ให้ระบุ Arrow เพื่อให้ Robot ชี้จุดเข้าไปที่ "iFrame" นั้นๆ
    Hover    id=iFrame >>> //button[@id='my-button']

45. Reload
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...     -  ใช้ในการ "โหลดหน้าเว็บใหม่" ในเบราว์เซอร์ที่กำลังทำงานอยู่ หรือ คือการรีเฟรชหน้าเว็บ นั่นเอง
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน
    #Ex1
    Reload

46. Clear Text
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...     -  ใช้ในการล้าง "ข้อความ" หรือ "ค่าที่ป้อนในฟิลด์ข้อความ (text field)" หรือ (Elements) ที่สามารถป้อนข้อความได้ในหน้าเว็บ
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${selector} (Mandatory) =  ระบุ "locator" หรือ (Xpath) ของ (Elements) เพื่อ Clear "ข้อความ" หรือ "ค่าที่ป้อนในฟิลด์ข้อความ (text field)"
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน
    #Ex1
    Clear Text    //input[@class='name']

    # Ex - หากติด "iFrame" ให้ระบุ Arrow เพื่อให้ Robot ชี้จุดเข้าไปที่ "iFrame" นั้นๆ
    Clear Text    id=iFrame >>> //input[@class='name']

47. Close Page
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...     -  ใช้ในการปิด "หน้าเว็บที่กำลังแสดงบนเบราว์เซอร์" หรือ "กลุ่มหน้าต่างเบราว์เซอร์ที่กำลังทำงาน"
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${page} (Optional) =  จะถูก (Default) "CURRENT" สามารถระบุเป็น "ALL"
    ...    2. ${context} (Optional) =  จะถูก (Default) "CURRENT" สามารถระบุเป็น "ALL"
    ...    3. ${browser} (Optional) =  จะถูก (Default) "CURRENT" สามารถระบุเป็น "ALL"
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน
    #Ex1 - ปิดหน้าเพจ ปัจจุบัน ของ บราวเซอร์ ปัจจุบัน
    Close Page  

    #Ex2 - ปิดหน้าเพจ ปัจจุบัน ของ บราวเซอร์ ปัจจุบัน
    Close Page     CURRENT    CURRENT    CURRENT

    #Ex3 - ปิดทุกหน้าเพจ ปัจจุบัน ของ ทุกบราวเซอร์ ปัจจุบันที่ถูกเปิดอยู่ เช่น "chromium (engine=Google Chrome, Microsoft Edge (since 2020), Opera),firefox,Safari"
    Close Page     ALL         ALL         ALL

48. Close Browser
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...     -  ใช้ในการปิด "เบราว์เซอร์ที่กำลังทำงาน"
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${browser} (Optional) =  จะถูก (Default) "CURRENT" สามารถระบุเป็น "ALL"
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน
    #Ex1
    Close Browser

    #Ex2 - ปิดทุกบราวเซอร์ ปัจจุบันที่ถูกเปิดอยู่ เช่น "chromium (engine=Google Chrome, Microsoft Edge (since 2020), Opera),firefox,Safari"
    Close Browser     ALL

49. Drag And Drop Relative To
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...     -  ใช้สำหรับ "ลาก (Elements)" ไป "ยังตำแหน่งที่กำหนด" และ "วาง (Elements)"
    ...    และ ต้องระบุตำแหน่ง "เริ่มต้น ของ (Elements)" และ "ตำแหน่งที่ต้องการวาง" ซึ่งจะต้องระบุ "x" แนวนอน และ "y" แนวตั้ง"
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${selector} (Mandatory) =  ระบุ "locator" หรือ (Xpath) ของ (Elements) เพื่อระบุ "ตำแหน่งของ (Elements) ที่ต้องการลาก"
    ...    2. ${x} (Mandatory) =  ตำแหน่ง "x" แนวนอน ของขนาดหน้าจอ คือ "ระยะทางแนวนอนที่ต้องการลาก" (บวกหรือลบจากตำแหน่งเริ่มต้น)
    ...    3. ${y} (Mandatory) =  ตำแหน่ง "y" แนวตั้ง ของขนาดหน้าจอ คือ "ระยะทางแนวตั้งที่ต้องการลาก" (บวกหรือลบจากตำแหน่งเริ่มต้น)
    ...    4. ${steps} (Optional) =  คือ ความไวของการลากเมาส์ 
    ...    - หากระบุ steps "มาก" เช่น 10 , 20 , 30 จะทำให้การเคลื่อนที่เมาส์เป็นไปอย่างราบรื่นและช้าลง และแม่นยำขึ้น
    ...    - หากระบุ steps "น้อย" เช่น 1 , 1.5 , 2 จะทำให้การเคลื่อนที่เมาส์เร็วขึ้น แต่ "อาจไม่มีความแม่นยำเท่ากับคำสั่งแรก"
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน
    # Ex1  ลาก (Elements) ไปด้านซ้าย 100 px
    Drag And Drop Relative To    id=indicator    x=-100    y=0

    # Ex2  ลาก (Elements) ไปด้านขวา 100px และเลื่อนลง 200px จากตำแหน่งเริ่มต้น
    Drag And Drop Relative To    id=indicator    x=100    y=200

    # Ex - หากติด "iFrame" ให้ระบุ Arrow เพื่อให้ Robot ชี้จุดเข้าไปที่ "iFrame" นั้นๆ
    Drag And Drop Relative To    id=iFrame >>> id=indicator    x=100    y=200

50. Focus
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...     -  ใช้ในการโฟกัส (focus) ไปยังองค์ประกอบ HTML (Elements) ที่กำหนด 
    ...    เพื่อให้ Robot (focus) และ "เจาะจงได้ละเอียดยิ่งขึ้น" หรือ (focus) ไปยัง "ฟิลด์ข้อมูล" ได้แม่นยำมากขึ้นและละเอียด
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${selector} (Mandatory) =  ระบุ "locator" หรือ (Xpath) ของ (Elements) เพื่อระบุ "ตำแหน่งของ (Elements) ที่ต้อง (focus)"
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน
    # Ex1  ลาก (Elements) ไปด้านซ้าย 100 px
    Focus    id=indicator

    # Ex - หากติด "iFrame" ให้ระบุ Arrow เพื่อให้ Robot ชี้จุดเข้าไปที่ "iFrame" นั้นๆ
    Focus    id=iFrame >>> id=indicator

51. Mouse Button
    [Documentation]    Owner: Patipan.w
    ...    ==>
    ...    Link Documentation (สามารถเข้าไปอ่านเพิ่มเติม) : ---> https://marketsquare.github.io/robotframework-browser/Browser.html
    ...     -  ใช้ในการจำลองการกดปุ่มเมาส์ (mouse button) ในการทำงานกับ HTML (Elements) ในหน้าเว็บ
    ...    ==>
    ...    Arguments : ที่ใช้งาน
    ...    1. ${action} (Mandatory) = ระบุการกระทำ เช่น 
    ...    - หากระบุ "click" = คลิกเมาส์ ,  หากระบุ "down" = คลิกเมาส์ค้าง,  หากระบุ "up" = ปล่อยเมาส์
    ...    2. ${x} (Optional) =  (ไม่บังคับ) ตำแหน่ง "x" แนวนอน ของขนาดหน้าจอ คือ "ตำแหน่งแนวนอนที่ต้อง Click" 
    ...    3. ${y} (Optional) =  (ไม่บังคับ) ตำแหน่ง "y" แนวตั้ง ของขนาดหน้าจอ คือ "ตำแหน่งแนวตั้งที่ต้อง Click"
    ...    4. ${button} (Optional) =  จะถูก (Default) = "left", สามารถกำหนดการคลิกเมาส์เป็นรูปแบบอิื่นๆได้ เช่น
    ...    - "middle" = Click ลูกกลิ้ง , "right" = Click ขวา
    ...    5. ${clickCount} (Optional) = จะถูก (Default) = "1", สามารถกำหนดจำนวนการคลิกเมาส์ได้ เช่น
    ...    - "Click" เช่น "2" จะเท่ากับการ " Click 2 ครั้ง"
    ...    6. ${delay} (Optional) =  คือ "การหน่วงเวลา" ระหว่าง "การกดปุ่มเมาส์" หรือ การกระทำ ${action} นั้นๆ เช่น
    ...    - หากระบุ delay "2000ms" จะเป็นทำการ "การหน่วงเวลา 2วินาที" จึงจะทำ ${action} นั้นๆ
    ...    ==>
    [Tags]    ตัวอย่างการใช้งาน
    # Ex1  - จำลองการ "คลิกเมาส์" ด้วยการกด "ซ้าย" จำนวน "1" ครั้ง
    Mouse Button    action=click    id=indicator

    # Ex2  - จำลองการ "คลิกเมาส์ค้าง" ด้วยการกด "ขวา" จำนวน "1" ครั้ง ระยะเวลา "20 วิ"
    Mouse Button    action=down    button=right    delay=20000ms    id=indicator

    # Ex3  - จำลองการ "คลิกเมาส์ ซ้าย 10 ครั้ง ทุก 2 วินาที"
    Mouse Button    action=click    clickCount=10    delay=2000ms    id=indicator