*** Settings ***
Library      String
Library      Collections
Library      BuiltIn
*** Test Cases ***
Simpe IF
    [Documentation]    Owner: Kachain.a
    [Tags]    ตัวอย่างการใช้งาน 
    ${random_number}    Evaluate    random.randint(0, 10)
    # อ่านเพิ่มเติมการสุ่มตัวเลขในภาษา Python: http://marcuscode.com/lang/python/random-numbers-in-python
    IF    ${random_number} > 5
        Log    Number ${random_number} more than 5     console=yes
    END  
    #คำถาม ถ้า ${random_number} มีค่าน้อยกว่า 5 จะเป็นอย่างไรครับ
    IF    ${random_number} < 5     Log    Number ${random_number} less than 5     console=yes 

Simpe IF ELSE
    [Documentation]    Owner: Kachain.a
    [Tags]    ตัวอย่างการใช้งาน 
    ${random_number}    Evaluate    random.randint(0, 10)
    IF    ${random_number} > 5
        Log    ${random_number} is odd!     console=yes
    ELSE
        Log    Number is ${random_number}     console=yes
    END
    #คำถาม ถ้า ${random_number} มีค่าเท่ากับ 5 จะเข้า IF หรือ ELSE

Simpe IF ELSE IF ELSE
    [Documentation]    Owner: Kachain.a
    [Tags]    ตัวอย่างการใช้งาน s
    ${random_letters}    Evaluate    random.choice(['A', 'B', 'C', 'D', 'E'])
    IF     '${random_letters}' == 'A'
        Log    I am 'A'     console=yes
    ELSE IF  '${random_letters}' == 'C'
        Log    I am 'C'     console=yes
    ELSE
        Log    I am '${random_letters}' is not 'A' or 'C'     console=yes
    END
    #คำถาม ถ้า ${random_letters} มีค่าเท่ากับ B จะเข้าไปทำงานบรรทัดไหน IF หรือ ELSE