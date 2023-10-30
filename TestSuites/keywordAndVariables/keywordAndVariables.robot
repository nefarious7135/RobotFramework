#  - List prefix name -
# Lable             lbl
# DropDownList      ddl
# TextBox           txt
# Table             tbl
# DateTimePicker    dtp
# Button            btn
# List              lst
# RadioButton       rdo
# Toggle            tgg
# MenuList          mnu
# CheckBox          cbx
# TabPage           tab
# Panel             pnl
# Image             img
# ProgressBar       prg
# Icon              icn
# PlaceHolder       phd

*** Variables ***
${txtExpectLogin}    Taweesin Suksompoch
${txtExpectStatus}    Available
${txtExpectLogout}    Welcome back, please login to your account.
${txtExpectWrong}    Wrong E-mail or Password
${txtExpectcheck}    Please check your Email or Password.
${txtUsername}        taweesis
${txtPassword}        Taw@2021
${Expect_username_Invalid}    Please fill username.
${Expect_password_Invalid}    Please fill password.

#xpath
${txt_loc_name}                 //div[@class="text-right leading-tight hidden sm:block"]//p
${txt_loc_status}               //div[@class="text-right leading-tight hidden sm:block"]//small
${nav_con_item}                 //div[@class="vs-con-items"]
${txt_loc_Logout}               //div[@class="vx-card__title mb-4"]//p
${lst_mnu_pro}                  //div[@class="vs-dropdown--custom vs-dropdown--menu"]
${btn_mnu_pro}                  //button[@class="vs-con-dropdown parent-dropdown cursor-pointer"]
${btn_sign_out}                 //span[text()="Logout"]
${btn_sing_in}                  //button[@id="่ldap_btn_sign_in"]
${hea_navbar}                   //div[@class="vs-con-items"]
${txt_loc_Wrong}                //h2[@id="swal2-title"]
${txt_loc_check}                //div[@id="swal2-content"]
${txt_username_valid}           //div[@id="ldap_username_valid"]
${txt_password_valid}           //div[@id="ldap_password_valid"]
${popup_swal2}                  //div[@class="swal2-popup swal2-modal swal2-show" and @aria-modal="true"]
${txt_loc_username}             //input[@id="ldap_username"]
${txt_loc_password}             //input[@id="ldap_password"]
${login_tabs_con}               //div[@class="p-8 login-tabs-container"]

*** Keywords ***
Input Text On Elements
    [Arguments]    ${locator}     ${text}  
    Fill Text    ${locator}     ${text} 

Verify Text On Elements
    [Arguments]    ${locator}     ${expect_text}    
    ${actual_text}    Get Text    ${locator} 
    Should Be Equal As Strings    ${actual_text}    ${expect_text}    

Open Browser Proect LDAP
    New Browser            chromium   headless=False 
    Set Browser Timeout    60s
    New Context            viewport={'width': 1366, 'height': 768}     ignoreHTTPSErrors=${True}
    New Page               https://10.138.40.47:3443/ 
    Click                  //button[@class="vs-component vs-button vs-button-primary vs-button-border"]
    Sleep                  3s
    Click                  //div[@class="col-12 text-center text-lg mt-3"]//a[text()="Login"]
    Sleep                  2s

Verify Login Success
    Input Text On Elements    ${txt_loc_username}    ${txtUsername}
    Input Text On Elements    ${txt_loc_password}    ${txtPassword}
    Click    ${btn_sing_in}    
    Sleep    5s 

Verify Login Error    
    Input Text On Elements    ${txt_loc_username}    ABC
    Input Text On Elements    ${txt_loc_password}    000
    Click    ${btn_sing_in}
    Sleep    3s