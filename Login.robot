*** Settings ***
Library    ExcelRobot
Library    Collections
Library    String
Library    Browser

*** Variables ***

${URL}    https://10.138.40.47:3443/

*** Test Cases ***
Login Success  
    Open Browser     ${URL}    
    Sleep    5
    


     