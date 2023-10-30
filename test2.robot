*** Settings ***
Library    ExcelRobot
Library    Collections
Library    String
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

test02   
    Open Excel	 ${CURDIR}\\TestExcel\\test.xlsx
    ${strColCount} =  Get Column Count  Sheet2
    Set Test Variable   ${Col_ID}   ${strColCount}
    ${strRowCount}  Get Row Count   Sheet2
    FOR    ${rowIndex}     IN RANGE    1    ${strRowCount}
 	    ${data}    Inner loop     ${rowIndex}
        Log    ${data}    console=yes
    END   
    
*** Keywords ***
Inner loop
    [Arguments]     ${row} 
    ${data}   Create List
    FOR     ${colIndex}    IN RANGE   0  ${Col_ID}
        ${DataALL}     Read Cell Data   sheet_name=Sheet2  column=${colIndex}     row=${row}
        Append To List    ${data}    ${DataALL}    
    END
    [Return]    ${data}    
     