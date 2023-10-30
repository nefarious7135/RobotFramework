*** Settings ***
Resource          MongoDB.robot

*** Keywords ***
ConnectSecureCRT
    [Arguments]    ${HostURL}
    SSHLibrary.Open Connection    ${HostURL}    timeout=1 hour
    SSHLibrary.Login    serveradm    ;kfw;hrecall
    Enable SSH Logging    test.log

ConnectSecureCRTkafaka
    [Arguments]    ${HostURL}
    SSHLibrary.Open Connection    ${HostURL}    timeout=1 hour
    SSHLibrary.Login    serveradm    ;kfw;hrecall
    Enable SSH Logging    test.log

ConnectSecureCRTLog
    [Arguments]    ${HostURL}
    SSHLibrary.Open Connection    ${HostURL}    timeout=1 hour
    SSHLibrary.Login    toro    equinox@toro;

ProduceKafka
    [Arguments]    ${cmdDeleteMassage}     ${cmdProduce}    ${produce}
    [Documentation]    ${cmdDeleteMassage} --> ลบ message
    ...    ${cmdProduce} --> คำสั่ง produce
    ...    ${produce} --> message ที่ต้องการ produce
    #เช็ค path ปัจจุบัน
    ${pwd}    SSHLibrary.Execute Command    pwd
    log    ${pwd}
    # #ลบ message ก่อนหน้าออกไปก่อน
    ${stdout}    SSHLibrary.Write    ${cmdDeleteMassage}
    sleep    5
    #run คำสัง produce
    ${stdout}    SSHLibrary.Write    ${cmdProduce}    loglevel=DEBUG
    sleep    5
    #ใส่ข้อมูล produce
    SSHLibrary.Write    ${produce}    loglevel=DEBUG
    Log    ${produce}

ProduceKafkaHeader
    [Arguments]    ${cmdDeleteMassage}    ${cmdProduce}    ${produce}
    [Documentation]    ${cmdDeleteMassage} --> ลบ message
    ...    ${cmdProduce} --> คำสั่ง produce
    ...    ${produce} --> message ที่ต้องการ produce
    #เช็ค path ปัจจุบัน
    ${pwd}    SSHLibrary.Execute Command    pwd
    log    ${pwd}
    #ลบ message ก่อนหน้าออกไปก่อน
    ${stdout}    SSHLibrary.Write    ${cmdDeleteMassage}
    Comment    sleep    10
    #run คำสัง produce
    ${stdout}    SSHLibrary.Write    ${cmdProduce}    loglevel=DEBUG
    sleep    3
    #ใส่ข้อมูล produce
    Comment    ${json}    BuiltIn.Set Variable    ${produce}
    Comment    ${DataHeader}    BuiltIn.Set Variable    ${Header}
    Comment    ${Value1}    Replace String    ${json}    {    ${DataHeader}    count=1
    Comment    BuiltIn.Log Many    {${Value1}}
    Comment    ${produce}    BuiltIn.Set Variable    {${Value1}}
    SSHLibrary.Write    ${produce}    loglevel=DEBUG
    log    ${produce}

ConsumeKafka
    [Arguments]    ${cmdConsume}    ${ConsumeResultFile}
    [Documentation]    ${cmdConsume} --> คำสั่ง consume
    ...    ${ConsumeResultFile} --> ชื่อไฟล์ที่จะเก็บข้อมูล consume
    ...
    ...    keyword นี้จะ consume ข้อมูลมา read และเก็บข้อมูล write ใส่ไฟล์เก็บไว้
    ...
    ...    return ข้อมูลที่ได้กลับไป (${output}) --> เรียกใช้โดย ${ConsumeResult}
    #เช็ค path ปัจจุบัน
    ${pwd}    SSHLibrary.Execute Command    pwd
    log    ${pwd}
    #run คำสัง consume
    ${stdin}    SSHLibrary.Write    ${cmdConsume}    loglevel=DEBUG
    sleep    5
    #read ข้อมูลที่ได้จากการ consume
    ${output}=    SSHLibrary.Read    loglevel=DEBUG    # Shown in the console due to loglevel
    #ตัดค่า > ที่ติดมากับข้อมูล
    ${output}    String.Replace String    ${output}    \r    ${EMPTY}
    ${output}    String.Replace String    ${output}    \n    ${EMPTY}
    Comment    ${output}    String.Replace String    ${output}    ${SPACE}    ${EMPTY}
    ${output}    String.Replace String    ${output}    ${EMPTY}
    ${output}    String.Replace String    ${output}    [?2004l    ${EMPTY}
    log    ${output}
    #เขียนข้อมูลที่ read มาได้จาก consume ลงไฟล์
    SSHLibrary.Execute Command    echo '${output}' >${pwd}/ConsumeResult/${ConsumeResultFile}.txt
    BuiltIn.Set Global Variable    ${ConsumeResult}    ${output}
    [Return]    ${output}

SetLogNull
    [Arguments]    ${Command_Name}    ${pathLog}
    ${filename}    SSHLibrary.Execute Command    find ${pathLog}/log/ -type f -mmin -5 -prune | grep ${Command_Name} |cut -d '/' -f8
    log    ${filename}
    IF    "${filename}" != ""
    SSHLibrary.Execute Command    echo "" > ${pathLog}/log/${filename}
    END

FlushLogbyCommandName
    [Arguments]    ${Command_Name}    ${Number_TestCase}    ${pathLog}
    ${pwd}    SSHLibrary.Execute Command    pwd
    log    ${pwd}
    BuiltIn.Sleep    2
    ${stdout}    SSHLibrary.Execute Command    cd ${pathLog}/log/
    log    ${stdout}
    ${filename}    SSHLibrary.Execute Command    find ${pathLog}/log/ -type f -mmin -5 -prune| grep ${Command_Name} |cut -d '/' -f8
    log    ${filename}
    Comment    SSHLibrary.Execute Command    cp ${pathLog}/log/${filename} /app/mfaf/TestResult/${Number_TestCase}.log
    SSHLibrary.Execute Command    cp ${pathLog}/log/${filename} /LOCAL-NAS/livingnetwork/nsb/log_mfaf/TestResult/${Number_TestCase}.log
    ${ls}    SSHLibrary.Execute Command    ls -lrt /app/mfaf/TestResult/
    log    ${ls}

SetMockupResponse
    [Arguments]    ${PathConfigAntiCorruptResponse}    ${PathDataAntiCorruptResponse}
    [Documentation]    ตอนเรียกใช้ควรวางต่อกับ keyword setLogNull เพราะ mockup อยู่ในเครื่อง 66 เครื่องเดียวกับ log จะได้ ConnectSecureCRT ครั้งเดียว
    ...    แต่ถ้าไม่วางต่อจาก setLog จะต้อง ConnectSecureCRT ก่อนทุกครั้ง
    ...
    ...
    ...    ${PathConfigAntiCorruptResponse} คือ Path ที่ \ Mockup อ่าน Response
    ...    ${PathDataAntiCorruptResponse} คือ Path file \ Data AntiCorrup Response ที่ต้องการ
    #Connect CRT
    Comment    ${PathData}    BuiltIn.Set Variable    ${PathDataAntiCorruptResponse}/${FileName}
    SSHLibrary.Execute Command    cp ${PathDataAntiCorruptResponse} ${PathConfigAntiCorruptResponse}

SetLogNull_NEB
    [Arguments]    ${Command_Name}    ${pathLog}
    ${filename}    SSHLibrary.Execute Command    find ${pathLog}/ -type f -mmin -5 -prune | grep ${Command_Name} |cut -d '/' -f7
    log    ${filename}
    IF    "${filename}" != ""
    SSHLibrary.Execute Command    echo "" > ${pathLog}/${filename}
    END

FlushLogbyCommandName_NEB
    [Arguments]    ${Command_Name}    ${Number_TestCase}    ${pathLog}
    ${pwd}    SSHLibrary.Execute Command    pwd
    log    ${pwd}
    BuiltIn.Sleep    2
    ${stdout}    SSHLibrary.Execute Command    cd ${pathLog}
    log    ${stdout}
    ${filename}    SSHLibrary.Execute Command    find ${pathLog}/ -type f -mmin -4 -prune| grep ${Command_Name} |cut -d '/' -f7
    log    ${filename}
    SSHLibrary.Execute Command    cp ${pathLog}/${filename} /app/mfaf/TestResult/${Number_TestCase}.log
    ${ls}    SSHLibrary.Execute Command    ls -lrt /app/mfaf/TestResult/
    log    ${ls}

CopyFileLM
    [Arguments]    ${pathFile}    ${filename}
    ${pwd}    SSHLibrary.Execute Command    pwd
    log    ${pwd}
    BuiltIn.Sleep    2
    ${stdout}    SSHLibrary.Execute Command    cd ${pathFile}
    log    ${stdout}
    ${filename}    SSHLibrary.Execute Command    find ${pathFile}/${filename}
    log    ${filename}
    SSHLibrary.Execute Command    cp ${pathFile}/${filename} /app/mfaf/network-event-bus/files/process/LM
