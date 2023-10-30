*** Settings ***
Library       String
Library       Collections
Library       BuiltIn

*** Variables ***
${name}       Kachain

*** Keywords ***
Log Language
    [Documentation]    Owner: Kachain.a
    [Tags]    ตัวอย่างการใช้งาน     
    Log     Korea    console=${True}

Log Language With Arguments
    [Documentation]    Owner: Kachain.a
    [Tags]    ตัวอย่างการใช้งาน 
    [Arguments]    ${language}
    Log     ${language}     console=${True}

Log Language Set Default Arguments
    [Documentation]    Owner: Kachain.a
    [Tags]    ตัวอย่างการใช้งาน 
    [Arguments]     ${language}=China
    Log     ${language}     console=${True}

Log Language is ${language}
    [Documentation]    Owner: Kachain.a
    [Tags]    ตัวอย่างการใช้งาน 
    Log     ${language}     console=${True}
    ${upper_language}       Convert To Upper Case         ${language}
    IF  '${upper_language}' == 'THAI'
        Log     Your language is... ${language}           console=${True}
        Log     Your language is... ${upper_language}     console=${True}
    ELSE
        Log     Your ฉhosen language is: '${language}'           console=${True}
    END

Log Language ${language} And Verify Initials
    [Documentation]    Owner: Kachain.a
    [Tags]    ตัวอย่างการใช้งาน 
    [Arguments]     ${value}
    Log     Your language is... ${language}      console=${True}
    Log     Arguments value is... ${value}       console=${True}
    IF   '${value}'=='English'
        Log     Success จ้า       console=${True} 
    END
    IF   '${language}'=='Thai'
        Log     คนไทยครับ       console=${True} 
    END

*** Test Cases ***
Example Keyword
    Log Language 
    Log Language With Arguments       English
    Log Language Set Default Arguments
    Log Language Set Default Arguments      Spain
    Log Language is Laos
    Log Language is Thai

Log name with command  
    Log     ${name}    console=${True}            

Example Keyword Use Embed And Arguments
    Log Language Thai And Verify Initials    English
    #ถ้า robotframework version ต่ำกว่า 6.1 จะไม่สามารถใช้ Embed และ Arguments พร้อมกันได้

