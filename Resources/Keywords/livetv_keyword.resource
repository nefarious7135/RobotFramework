*** Settings ***
Resource    ../../TestSuites/resource_init.robot

*** Keywords ***
Select Live TV In Menu Bar
    Wait For Elements State     ${mnu_livetv_sidemenu}    visible             
    Scroll To Element           ${mnu_livetv_sidemenu}
    Click      ${mnu_livetv_sidemenu}

Verify Live TV Page
    Wait For Elements State               ${pnl_tvprogram_guides}                visible
    Wait For Elements State               ${lbl_Livetv_channel_active}           visible
    Wait For Elements State               ${lbl_Livetv_channel_nameactive}       visible
    Wait For Elements State               ${img_Logo_channel_active}             visible
    ${channel_number}       Get Text      ${lbl_Livetv_channel_active}
    ${channel_name}         Get Text      ${lbl_Livetv_channel_nameactive}
    Log     Chanel is... ${channel_number} : ${channel_name}    console=${True}
    Take Screenshot                       fullPage=${True}

