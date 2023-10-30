*** Settings ***
Library       String
Library       Collections
Library       BuiltIn

*** Variables ***
@{animal}     Ant   Cat    Dog    Cow
@{birds}      Eagle    Falcon    Ladybird
@{letters}    a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z

${user1}      Ball
${user2}      Bas
${user3}      Best
${user4}      Bow

*** Test Cases ***
#ตัวอย่าง FOR IN RANGE
Loop 10 times
    [Documentation]    Owner: Kachain.a
    [Tags]    ตัวอย่างการใช้งาน 
    Log    start: 0 ,inc: 1 , end:10     console=yes
    FOR    ${num}    IN RANGE    10
        Log    ${num}    console=yes
    END

Loop 10 Times Starting With 1
    [Documentation]    Owner: Kachain.a
    [Tags]    ตัวอย่างการใช้งาน 
    Log    start: 1 ,inc: 1 , end:11     console=yes
    FOR    ${num}    IN RANGE    1    10
        Log    ${num}     console=yes
    END

Loop Starting With 0 To 20 In Steps Of 5
    [Documentation]    Owner: Kachain.a
    [Tags]    ตัวอย่างการใช้งาน 
    Log    start: 0 ,inc: 5 , end:20     console=yes
    FOR    ${num}    IN RANGE    0    20    5
        Log    ${num}    console=yes
    END

Countdown From 10 To 0 In 10 Seconds
    [Documentation]    Owner: Kachain.a
    [Tags]    ตัวอย่างการใช้งาน 
    Log    start: 10 ,inc: -1 , end:0     console=yes
    FOR    ${num}    IN RANGE    10    -1    -1
        Log    ${num}       console=yes
        IF    ${num} == 5   BREAK
    END
    Log    🎉🥳 HAPPY NEW YEAR !!! 🍾       console=yes     

#ตัวอย่าง FOR IN
Loop For IN list
    [Documentation]    Owner: Kachain.a
    [Tags]    ตัวอย่างการใช้งาน 
    FOR   ${var}    IN    @{animal}
        Log     ${var}    console=yes
    END

Loop Two Lists After Each Other
    [Documentation]    Owner: Kachain.a
    [Tags]    ตัวอย่างการใช้งาน 
    FOR   ${var}    IN    @{animal}    @{birds}
        Log     ${var}    console=yes
    END

#ตัวอย่าง FOR IN ENUMERATE
Loop With Index Over Letters
    [Documentation]    Owner: Kachain.a
    [Tags]    ตัวอย่างการใช้งาน 
    Log    Lists the Alphabeth -->      console=yes
    FOR    ${index}    ${letter}    IN ENUMERATE    @{letters}
        Log    The ${index + 1}. letter is ${letter}    console=yes
    END

Nest Loops
    [Documentation]    Owner: Kachain.a
    [Tags]    ตัวอย่างการใช้งาน 
    @{alphabets}=    Create List    A       B
    @{numbers}=      Create List    1       2
    FOR    ${alphabet}    IN    @{alphabets}
        FOR    ${number}    IN    @{numbers}
            Log    ${alphabet}${number}     console=yes
        END
    END
