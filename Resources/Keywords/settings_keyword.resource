*** Settings ***
Resource    ../../TestSuites/resource_init.robot

*** Keywords ***
Verify Settings Page ${LANG}
    ${LANG_LOWWER}         Convert To Lower Case    ${LANG}
    ${language_active}     Get Text    ${lbl_language_green_active_settings}
    Log     Language is : ${language_active}    console=${True}
    IF   "${LANG_LOWWER}"=="th" and "${language_active}"=="ไทย"
        Wait For Elements State        ${lbl_header_settings}\[normalize-space(text())="${msg_settings_th}"]      visible
        Wait For Elements State        ${lbl_my_profile}\[normalize-space(text())="${msg_my_profile_th}"]         visible
        Wait For Elements State        ${lbl_my_account}\[normalize-space(text())="${msg_my_account_th}"]         visible 
    ELSE IF   "${LANG_LOWWER}"=="th" and "${language_active}"!="ไทย"
        Click    ${lbl_select_language}\[normalize-space(text())="ไทย"]
        Wait For Elements State        ${lbl_header_settings}\[normalize-space(text())="${msg_settings_th}"]      visible
        Wait For Elements State        ${lbl_my_profile}\[normalize-space(text())="${msg_my_profile_th}"]         visible
        Wait For Elements State        ${lbl_my_account}\[normalize-space(text())="${msg_my_account_th}"]         visible 
    ELSE IF    "${LANG_LOWWER}"=="en" and "${language_active}"!="English"
        Click    ${lbl_select_language}\[normalize-space(text())="English"]
        Wait For Elements State        ${lbl_header_settings}\[normalize-space(text())="${msg_settings_en}"]      visible
        Wait For Elements State        ${lbl_my_profile}\[normalize-space(text())="${msg_my_profile_en}"]         visible
        Wait For Elements State        ${lbl_my_account}\[normalize-space(text())="${msg_my_account_en}"]         visible 
    ELSE IF    "${LANG_LOWWER}"=="en" and "${language_active}"=="English"
        Wait For Elements State        ${lbl_header_settings}\[normalize-space(text())="${msg_settings_en}"]      visible
        Wait For Elements State        ${lbl_my_profile}\[normalize-space(text())="${msg_my_profile_en}"]         visible
        Wait For Elements State        ${lbl_my_account}\[normalize-space(text())="${msg_my_account_en}"]         visible         
    ELSE
        Fail  Not Support ${LANG}
    END
    Take Screenshot                fullPage=${True} 