*** Settings ***
Library    rpa
*** Test Cases ***
test01
    Open Excel    ${CURDIR}\\TestExcel\\test.xlsx    
    FOR  ${i}  IN RANGE     1    5
        ${test01}    Read Cell Data     sheet_name=Sheet2    column=0    row=${i}
        ${test02}    Read Cell Data     sheet_name=Sheet2    column=1    row=${i}
        ${test03}    Read Cell Data     sheet_name=Sheet2    column=2    row=${i}
        ${test04}    Read Cell Data     sheet_name=Sheet2    column=3    row=${i}
        ${result}     Catenate    ${test01} ${test02} ${test03} ${test04}
        ${Splitresult}    Split String    ${result}
        Log    ${Splitresult}   console=yes   
    END


QueryDataReturnlastMod
    [Arguments]    ${DBName}    ${CollectionName}    ${JSON}
    ConnectMongoDB    ${DBName}
    ${lastMod}    Retrieve MongoDB Records With Desired Fields    ${DBName}    ${CollectionName}    ${JSON}    lastModifiedDate    True    
    ${lastMod}    Replace String    ${lastMod}    '    ${EMPTY}
    ${lastMod}    Remove String    ${lastMod}    datetime.datetime
    ${lastMod}    Split String    ${lastMod}
    # Catenate
    # ${ID}    Remove String    ${ID}    dict_items([( _id
    # ${ID}    Remove String    ${ID}    , ObjectId(
    # BuiltIn.Log Many    ${ID}
    # IF    "${ID}" == ""
    # ${ID}    Set Variable    ${EMPTY}
    # ELSE
    # ${SplitID}=    Split String    ${ID}
    # ${ID}    Set Variable    ${SplitID[0]}
    Log    ${lastMod}    console=yes
    # END
    # [Return]    ${lastMod[0]}   