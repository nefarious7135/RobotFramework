*** Settings ***
Resource        ./resource_init.robot
Resource        ../TestSuites/keywordAndVariables/keywordAndVariables.robot

*** Test Cases ***
TST_F1_1_1_1
    Open Browser Proect LDAP  
    Verify Login Success                 
    Wait For Elements State    ${nav_con_item}    visible    
    Verify Text On Elements    ${txt_loc_name}    ${txtExpectLogin}
    Verify Text On Elements    ${txt_loc_status}    ${txtExpectStatus}
    Take Screenshot    fullPage=${True}

TST_F1_1_1_2    
    Open Browser Proect LDAP 
    Verify Login Success
    Wait For Elements State    ${hea_navbar}    visible
    Click    ${btn_mnu_pro}
    Wait For Elements State    ${lst_mnu_pro}     visible
    Click    ${btn_sign_out}  
    Sleep    3s
    Wait For Elements State    ${login_tabs_con}     visible
    Verify Text On Elements    ${txt_loc_Logout}    ${txtExpectLogout}
    Take Screenshot    fullPage=${True}

TST_F1_0_1_1
    Open Browser Proect LDAP
    Verify Login Error
    Wait For Elements State    ${popup_swal2}    visible
    Verify Text On Elements    ${txt_loc_Wrong}    ${txtExpectWrong}
    Verify Text On Elements    ${txt_loc_check}    ${txtExpectcheck}
    Take Screenshot    fullPage=${True}

TST_F1_0_1_2
    Open Browser Proect LDAP  
    Input Text On Elements    ${txt_loc_username}    ${EMPTY}
    Input Text On Elements    ${txt_loc_password}    ${EMPTY} 
    Click    ${btn_sing_in}
    ${Actual_username_Invalid}    Get Text    ${txt_username_valid}
    ${Actual_username_Invalid}    Remove String Using Regexp    ${Actual_username_Invalid}    \n${SPACE}+    ${EMPTY}
    Should Be Equal As Strings    ${actual_username_Invalid}    ${Expect_username_Invalid}    
    ${Actual_password_Invalid}    Get Text    ${txt_password_valid}
    ${Actual_password_Invalid}    Remove String Using Regexp    ${Actual_password_Invalid}    \n${SPACE}+    ${EMPTY}
    Should Be Equal As Strings    ${actual_password_Invalid}    ${Expect_password_Invalid}  
    Take Screenshot    fullPage=${True}

