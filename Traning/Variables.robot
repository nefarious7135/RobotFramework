*** Settings ***
Library      String
Library      Collections
Library      BuiltIn

*** Variables ***
# Scalar ตัวแปรที่เก็บค่าคงที (สัญลักษณ์ $)
# ${Reg_sideMenu}     [A-Z]+\\s.\\s[A-Z]+|[A-Z]+|[A-Z]+\\s[A-Z]+
${firstname}    Kachain
${lastname}     Anuritpraseards
${nickname}     Ball
${url}          https://robotframework.org
${path}         /robotframework
# List ตัวแปรที่สามารถกำหนดค่าได้มากกว่า 1 ค่าใน variable เดียวกัน (สัญลักษณ์ @)
@{LETTERS}      a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z
@{name}         Kachain  Anuritpraseards     
@{animal}       Ant  Bird  Cat  Dog  Elephant 
# Dictionary หรือ Json ตัวแปรที่เก็บข้อมูลได้หลายข้อมูล ซึ่งตัวแปร Dictionary มีความคล้ายคลึงกับตัวแปรแบบ List 
# แต่ต่างกันที่ สามารถเข้าถึงข้อมูลได้ด้วยการใช้ key แทนที่จะเป็น index แบบ list
&{profile}      firstname=Kachain   nickname=Ball   phone=0927627293

*** Test Cases ***
Test Case With Scalar Variables
    [Documentation]    Owner: Kachain.a
    [Tags]    ตัวอย่างการใช้งาน 
    ${message}    Catenate
    ...    ${\n}First Name : ${firstname}
    ...    ${\n}Last Name : ${lastname}
    #อยากได้ log ของ ชื่อเล่น ช่วยโค้ดเพิ่มให้หน่อยครับ
    #อยากได้ log ของ ชื่อจริง สกุล ช่วยโค้ดเพิ่มให้หน่อยครับ
    Log    ${message}    console=yes

List Variables
    [Documentation]    Owner: Kachain.a
    [Tags]    ตัวอย่างการใช้งาน 
    Log Many    @{LETTERS}  # unpacks the list and hands over 26 arguments
    Log Many    1  2  3  4  5 
    Log    ${LETTERS}    console=yes  # a single variable as argument
    Log    ${name}       console=yes
    Log    ${name}[0]    console=yes
    Log    ${name}[1]    console=yes

List With Keyword On BuiltIn
    [Documentation]    Owner: Kachain.a
    [Tags]    ตัวอย่างการใช้งาน 
    ${car}   Create List     NISSAN  TOYOTA  HONDA  MAZDA
    Log      ${car}          console=yes
    Log      ${car}[0]       console=yes

Dictionary Variable Documentation
    [Documentation]    Owner: Kachain.a
    [Tags]    ตัวอย่างการใช้งาน 
    Log      ${profile}              console=yes
    Log      ${profile.nickname}     console=yes 
    Log      ${profile}[nickname]    console=yes    