*** Settings ***
Library    ExcelRobot
Library    Collections
Library    String

#pip install robotframework-excel
#pip install xlrd==1.2.0
#https://jirapatham.medium.com/%E0%B8%A7%E0%B8%B4%E0%B8%98%E0%B8%B5%E0%B8%94%E0%B8%B6%E0%B8%87%E0%B8%82%E0%B9%89%E0%B8%AD%E0%B8%A1%E0%B8%B9%E0%B8%A5%E0%B8%88%E0%B8%B2%E0%B8%81-excel-%E0%B8%94%E0%B9%89%E0%B8%A7%E0%B8%A2-robot-framework-543b64737086
#https://rpaframework.org/libraries/excel_files/

*** Test Cases ***
test01
    Open Excel    ${CURDIR}\\TestExcel\\test.xlsx    
    FOR  ${i}  IN RANGE     1    5
        ${test01}    Read Cell Data     sheet_name=Sheet1    column=0    row=${i}
        ${test02}    Read Cell Data     sheet_name=Sheet1    column=1    row=${i}
        ${test03}    Read Cell Data     sheet_name=Sheet1    column=2    row=${i}
        ${test04}    Read Cell Data     sheet_name=Sheet1    column=3    row=${i}
        ${result}     Catenate    ${test01} ${test02} ${test03} ${test04}
        ${Splitresult}    Split String    ${result}
        Log    ${Splitresult}   console=yes   
    END

test02   
    Open Excel	 ${CURDIR}\\TestExcel\\test.xlsx
    ${strColCount} =  Get Column Count  Sheet1
    Set Test Variable   ${Col_ID}   ${strColCount}
    ${strRowCount}  Get Row Count   Sheet1
    FOR    ${row}     IN RANGE    1    ${strRowCount}
 	    ${data}    Inner loop     ${row}
        Log    ${data}    console=yes
    END   
    
*** Keywords ***
Inner loop
    [Arguments]     ${row} 
    ${data}   Create List
    FOR     ${colIndex}    IN RANGE   0  ${Col_ID}
        ${DataALL}     Read Cell Data   sheet_name=Sheet1  column=${colIndex}     row=${row}
        Append To List    ${data}    ${DataALL}    
    END
    [Return]    ${data}    
     