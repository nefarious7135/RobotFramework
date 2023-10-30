*** Settings ***
Library       String
Library       Collections
Library       BuiltIn

*** Variables ***
@{animal}     Ant   Cat    Dog    Cow
@{birds}      Eagle    Falcon    Ladybird
@{letters}    a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z

*** Test Cases ***
WHILE: Exit loop with BREAK
    [Documentation]    Owner: Kachain.a
    [Tags]    ตัวอย่างการใช้งาน 
    WHILE    True
        Log    Log Before BREAK Loop.      console=yes
        BREAK
        Log    This will not be logged.    console=yes
    END
    
WHILE: Loop while condition evaluates to True or the default loop limit is hit
    [Documentation]    Owner: Kachain.a
    [Tags]    ตัวอย่างการใช้งาน 
    ${x}=    Set Variable    ${0}
    WHILE    ${x} < 3
        Log    Executed as long as the condition ${x} is True.    console=yes
        ${x}=    Evaluate    ${x} + 1
    END

WHILE: Loop while the given limit is hit
    [Documentation]    Owner: Kachain.a
    [Tags]    ตัวอย่างการใช้งาน 
    TRY
        WHILE    True    limit=7
            Log    Executed until the given loop limit (10) is hit.     console=yes
        END
    EXCEPT    WHILE loop was aborted    type=start
        Log    The loop did not finish within the limit.        console=yes
    END

WHILE: Skip a loop iteration with CONTINUE
    [Documentation]    Owner: Kachain.a
    [Tags]    ตัวอย่างการใช้งาน 
    ${x}=    Set Variable    ${0}
    WHILE    ${x} < 3
        ${x}=    Evaluate    ${x} + 1
        IF    ${x} == 2    CONTINUE       # Skip this iteration.
        Log    x = ${x}    console=yes    # x = 1, x = 3
    END
