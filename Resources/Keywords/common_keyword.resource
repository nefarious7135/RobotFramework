*** Settings ***
Resource    ../../TestSuites/resource_init.robot

*** Keywords ***

Verify Side Menu Hamburger (No Loop) ตัวอย่างที่ 1 
    # เช็ค Logo "AIS" , Button "Close"
    Wait For Elements State         ${icn_logo_ais_side_menu}                visible
    Wait For Elements State         ${btn_close_side_menu}                   visible
    # เช็ค Icon "Side Menu"
    Wait For Elements State         ${icn_home_sidemenu}                     visible
    Wait For Elements State         ${icn_livetv_sidemenu}                   visible
    Wait For Elements State         ${icn_sports_sidemenu}                   visible
    Wait For Elements State         ${icn_series_sidemenu}                   visible
    Wait For Elements State         ${icn_movies_sidemenu}                   visible
    Wait For Elements State         ${icn_anime_sidemenu}                    visible
    Wait For Elements State         ${icn_kids_and_family_sidemenu}          visible
    Wait For Elements State         ${icn_music_sidemenu}                    visible
    Wait For Elements State         ${icn_packeges_sidemenu}                 visible
    Wait For Elements State         ${icn_other_app_sidemenu}                visible
    Wait For Elements State         ${icn_setting_sidemenu}                  visible
    # เช็ค Text "Side Menu"
    Verify Text On Elements         ${mnu_home_sidemenu}                     ${msg_home_sidemenu}      
    Verify Text On Elements         ${mnu_livetv_sidemenu}                   ${msg_live_tv_sidemenu}      
    Verify Text On Elements         ${mnu_sports_sidemenu}                   ${msg_sports_sidemenu}    
    Verify Text On Elements         ${mnu_series_sidemenu}                   ${msg_series_sidemenu}     
    Verify Text On Elements         ${mnu_movies_sidemenu}                   ${msg_movies_sidemenu}             
    Verify Text On Elements         ${mnu_anime_sidemenu}                    ${msg_anime_sidemenu}    
    Verify Text On Elements         ${mnu_kids_and_family_sidemenu}          ${msg_kids_family_sidemenu}
    Verify Text On Elements         ${mnu_music_sidemenu}                    ${msg_music_sidemenu}
    Verify Text On Elements         ${mnu_packages_sidemenu}                 ${msg_packages_sidemenu}
    Verify Text On Elements         ${mnu_otherapp_sidemenu}                 ${msg_other_app_sidemenu}   
    Verify Text On Elements         ${mnu_settings_sidemenu}                 ${msg_settings_sidemenu} 
    Take Screenshot                 fullPage=${True}

Verify Side Menu Hamburger (Loop) ตัวอย่างที่ 2
    FOR  ${icon_sidemenu}  IN  @{list_icon_sidemenu}
        Wait For Elements State    ${icon_sidemenu}    visible
    END
    ${index} =    Set Variable      ${0}
    FOR  ${locator_menu}  IN  @{list_menu_sidemenu}
         Verify Text On Elements    ${locator_menu}    ${list_msg_sidemenu}[${index}]
         ${index}    Evaluate       int(${index}+1)
    END
    Take Screenshot    fullPage=${True}

Verify Side Menu Hamburger (Loop) ตัวอย่างที่ 3
    ${list_menu_actual}   Create List       
    ${count}       Get Elements           ${lst_menu_sidemenu} 
    ${Length}      Get Length             ${count}
    FOR    ${index}  IN RANGE             1    ${Length}+1
                Wait For Elements State   ${lst_icon_sidemenu}\[${index}]    visible
                ${result}    Get Text     ${lst_menu_sidemenu}\[${index}]
                Append To List            ${list_menu_actual}   ${result}
                Log       ${result}       console=${True}
    END
    Lists Should Be Equal    ${list_menu_actual}    ${list_msg_sidemenu}    ignore_order=${True}
    ${log_sidemenu}    Catenate
    ...    ${\n}Side Menu AIS PLAY
    ...    ${\n} Expect = ${list_msg_sidemenu}
    ...    ${\n} Actual = ${list_menu_actual}
    Log    ${log_sidemenu}     console=${True}
    Take Screenshot    fullPage=${True}    

Loading Home Page Ais Play Success
    WHILE   True    limit=${browser_timeout}
            ${current_url}        Get Current Url
            ${status}    Run Keyword And Return Status    Should Be Equal As Strings     ${current_url}    ${web.home_ais_play}
            IF      ${status} == ${True}     BREAK
            Sleep   2s            
    END
    Wait For Elements State      ${img_logo_header_aisplay}       visible
    Take Screenshot    fullPage=${True}

Close Popup Login With Guest Mode 
    ${element_visible}      Run Keyword And Return Status     Wait For Elements State     ${lbl_login_guest}        visible    
    IF   ${element_visible} == ${True}
        WHILE    ${True}   limit=2
            Click          ${lbl_login_guest}
            ${status}      Run Keyword And Return Status     Wait For Elements State     ${btn_accept}       visible
            IF  ${status} == ${True}                         BREAK  
        END
        Take Screenshot
        Focus         ${btn_accept}
        Click         ${btn_accept}
    END

Get Current Url           
   ${url}      Get Url 	 
   ${url}      Should Match Regexp        ${url}     .+
   [Return]    ${url}

Choose Language 
    ${element_visible}   Run Keyword And Return Status   Wait For Elements State    ${btn_login_home}    visible
    IF    ${element_visible} == ${True}
        ${title}         Get Text      ${btn_login_home}
        IF    '${title}' == 'Login' and '${LANG}' == 'TH'                  Change Language Thai
        ...    ELSE IF    '${title}' == 'เข้าสู่ระบบ' and '${LANG}' == 'EN'   Change Language English
    ELSE
        Wait For Elements State       ${btn_logout_home}    visible
        ${title}         Get Text      ${btn_logout_home}
        IF    '${title}' == 'Logout' and '${LANG}' == 'TH'                   Change Language Thai
        ...    ELSE IF    '${title}' == 'ออกจากระบบ' and '${LANG}' == 'EN'   Change Language English
    END
    Take Screenshot    fullPage=${True}

Change Language ${language}
    Select In Menu Bar Settings
    ${language_lower}    Convert To Lower Case    ${language}
    Click    ${lbl_language_${language_lower}_settings}
    Verify Settings Page Language ${language}
    Go To Home Page

Go To Home Page
    ${element_visible}    Run Keyword And Return Status    Wait For Elements State    ${img_logo_header_aisplay}    visible
    IF    ${element_visible} == ${True}
        Click    ${img_logo_header_aisplay}
        Sleep    2s
    ELSE
        Go To    ${web.home_ais_play}
    END
    Loading Home Page Ais Play Success

Verify Settings Page Language ${language}
    ${language_lower}    Convert To Lower Case    ${language}
    FOR  ${icon}  IN  @{list_icon_setting}
        Wait For Elements State    ${icon}    visible
    END
    ${index} =    Set Variable    ${0}
    FOR  ${title}  IN  @{list_title_setting}
         Verify Text On Elements    ${title}    ${list_msg_settings}[${index}]
         ${index}    Evaluate       int(${index}+1)
    END
    Wait For Elements State    ${lbl_language_green_active_settings}    visible
    ${result_language}    Get Text  ${lbl_language_green_active_settings}
    IF    "${language}" == "Thai"    
              Wait For Elements State    ${lbl_language_english_active_settings}    hidden
              Should Be Equal As Strings    ${result_language}    ${msg_${language_lower}_settings} 
    ELSE IF   "${language}" == "English"    
                   Wait For Elements State    ${lbl_language_thai_active_settings}    hidden
                   Should Be Equal As Strings    ${result_language}    ${msg_${language_lower}_settings} 
    ELSE     
        Fail   This keyword don't support Language "${language}".
    END 
    Take Screenshot                fullPage=${True}

Select In Menu Bar ${menu}
    ${menu}    Convert To Lower Case    ${menu}
    Click      ${btn_hamberger}                                                       
    Wait For Elements State     ${mnu_${menu}_sidemenu}    visible             
    Click      ${mnu_${menu}_sidemenu}

Go To Side Menu Hamburger 
   Wait For Elements State    ${btn_hamberger}    visible
   Click    ${btn_hamberger}
   Wait For Elements State    ${pnl_hamberger}    visible
   Take Screenshot    fullPage=${True}

Waiting For Results And Take Screenshot
    [Arguments]  ${time}=3s    ${fullPage}=${True}
    Sleep  ${time}
    Take Screenshot    fullPage=${True}

Verify Text On Elements
    [Arguments]    ${locator}     ${expect_text}    
    ${actual_text}    Get Text    ${locator}
    # Log    ${actual_text}    console=yes   
    Should Be Equal As Strings    ${actual_text}    ${expect_text}    strip_spaces=${True}
    ...    msg=The text of attribute element '${locator}' should have been '${expect_text}' but in fact it was '${actual_text}'.



Select Login On Ais Play
    Wait For Elements State    ${btn_login_home}    visible
    Click    ${btn_login_home}
    Wait For Elements State    ${btn_login}         visible
    Click    ${btn_login}
    Take Screenshot    fullPage=${True}

Switch Icon Language On Login Page
   Wait For Elements State    ${lbl_login_green}    visible
   ${en_disabled}  Run Keyword And Return Status    Wait For Elements State     ${img_login_switch_en_disabled}     enabled     1s     
   ${th_disabled}  Run Keyword And Return Status    Wait For Elements State     ${img_login_switch_th_disabled}     enabled     1s
   Log        ${LANG}
   IF         ${th_disabled} == ${True} and '${LANG}' == 'EN'
              Log      Show switch icon is "EN" and language on page is "TH".
              Click    ${img_login_switch_en}
              Wait For Elements State    ${img_login_switch_en_disabled}     enabled
   ELSE IF    ${en_disabled} == ${True} and '${LANG}' == 'TH'
              Log      Show switch icon is "TH" and language on page is "EN".            
              Click    ${img_login_switch_th}
              Wait For Elements State    ${img_login_switch_th_disabled}     enabled
   ELSE       
              Log      Language '${LANG}' is 'Enabled'.
   END
   Take Screenshot    fullPage=${True}

Input Phone Number And Get OTP
   [Arguments]    ${mobile_no}
   Fill Text          ${txt_mobile_no}    ${mobile_no}
   Take Screenshot    fullPage=${True}
   Click              ${btn_req_otp}

Input Invalid OTP And Click OK Button
   [Arguments]    ${otp_number}
   Sleep    1s
   Wait For Elements State          ${txt_otp}      visible
   Fill Text          ${txt_otp}    ${otp_number}
   Click              ${btn_otp_ok}
   Take Screenshot    fullPage=${True}

Verify Error Invalid OTP Message
   Wait For Elements State     ${pnl_error_invalid}    visible
   Verify Text On Elements     ${lbl_error_invalid}    ${msg_error_invalid_otp}
   Waiting For Results And Take Screenshot

Search On Aisplay Top Header Bar
    [Arguments]    ${text} 
    Click                          ${btn_search}
    Wait For Elements State        ${btn_active_search}    visible        
    # Wait For Elements State        ${txt_search}           visible       
    Fill Text                      ${txt_search}           ${text}
    Set Test Variable              ${TEXT_SEARCH}          ${text}
    # Waiting For Results And Take Screenshot
    Click                          ${btn_active_search}

Verify Message Search Not Found On Movies Section
    Wait For Elements State        ${lbl_results_search_not_found_movies}    visible
    ${pattern_regexp} =  Set Variable If   
    ...  "${LANG}" == "TH"         ^ไม่พบ "Movies" ไม่ได้เลือกหมวด:$
    ...  "${LANG}" == "EN"         ^Not found Movies with keywords:$
    ${text_message}    Get Text And Should Match Regexp    ${lbl_message_search_movies}              ${pattern_regexp}
    ${text_search}     Get Text And Should Match Regexp    ${lbl_results_search_not_found_movies}    ^${TEXT_SEARCH}$
    Log    '${text_message}${text_search}'.
    Waiting For Results And Take Screenshot
    
Get Text And Should Match Regexp
   [Arguments]    ${locator}    ${pattern}             
   ${value}    Get Text 	    ${locator}  
   ${match}    Should Match Regexp    ${value}     ${pattern}
   [Return]    ${value}

Verify Search Success
   Wait For Elements State      ${lbl_header_result_search}   visible 
   Wait For Elements State      ${lbl_header_value_search}    visible
   ${value_result}     Get Text 	    ${lbl_header_result_search}
   ${value_search}     Get Text 	    ${lbl_header_value_search} 
   Should Be Equal As Strings           ${value_result}        ${msg_header_result_search}
   Should Be Equal As Strings           ${value_search}        ${TEXT_SEARCH}
   Log    '${value_result} ${value_search}'.    console=yes
   Waiting For Results And Take Screenshot

Verify Count Text And Icon On Side Menu Hamburger (Loop)
    ${count_icon}         Get Elements      ${lst_icon_sidemenu}
    ${length_icon}        Get Length        ${count_icon}
    FOR    ${i}  IN RANGE    1    ${length_icon}+1
             Wait For Elements State    ${lst_icon_sidemenu}\[${i}]   visible
    END
    ${count_menu}         Get Elements      ${lst_menu_sidemenu}
    ${length_menu}        Get Length        ${count_menu}
    FOR    ${i}  IN RANGE    1    ${length_menu}+1
             ${text_sidemenu}    Get Text    ${lst_icon_sidemenu}\[${i}]
             Should Match Regexp    ${lst_menu_sidemenu}     .+
    END
    Should Be Equal As Strings    ${length_icon}    ${length_menu}
    Log    'Icon is count '${length_icon}' and Text is count '${length_menu}'.    console=yes
    Waiting For Results And Take Screenshot

Scroll To Section ${title} On Ais Play Home Page
   WHILE    ${True}   limit=${timeout_120s}
       ${status}      Run Keyword And Return Status     
       ...    Wait For Elements State     //h2[@class="default-title pro-carousel-component-title" and normalize-space(text())="${title}"]       visible    1s
       IF  ${status} == ${False}    Scroll By    selector=${None}    vertical=50%     horizontal=0    behavior=smooth
       ...    ELSE    BREAK
       Sleep    ${timeout_3s}
       Waiting For Results And Take Screenshot    fullPage=${False}
   END
   Scroll To Element    //h2[@class="default-title pro-carousel-component-title" and normalize-space(text())="${title}"]
   Waiting For Results And Take Screenshot

Scroll Find Element
   WHILE    ${True}   limit=5
       ${status}      Run Keyword And Return Status     
       ...    Wait For Elements State     ${locator}       visible    1s
       IF  ${status} == ${False}    Scroll By    selector=${None}    vertical=50%     horizontal=0    behavior=smooth
       ...    ELSE    BREAK
       Sleep    ${timeout_3s}
       Waiting For Results And Take Screenshot    fullPage=${False}
   END
   Scroll To Element    ${locator}
   Waiting For Results And Take Screenshot

Verify All Element On Series Season Detail Page
    Verify Header Series Detail Page
    WHILE    ${True}   limit=5
        ${status}      Run Keyword And Return Status     
        ...    Wait For Elements State     ${pnl_footer}       visible    1s
        IF  ${status} == ${False}    Scroll By    selector=${None}    vertical=50%     horizontal=0    behavior=smooth
        ...    ELSE    BREAK
        Sleep    ${timeout_3s}
    END
    Scroll To Element    ${pnl_footer}
    ${status}   Run Keyword And Return Status  Wait For Elements State    (${pnl_list_season})\[1]    visible  
    IF   ${status} == ${True}
            ${count}       Get Elements       ${pnl_list_season} 
            ${Length}      Get Length         ${count}
            FOR  ${season}  IN RANGE    1     ${Length}+1
                Browser.Scroll To Element     (${pnl_list_season})\[${season}]
                ${title_season}    Get Text And Should Match Regexp    (${pnl_list_season})\[${season}]    .+
                ${count}   Get Elements                        (${pnl_list_episode})\[${season}]//a
                ${Length}  Get Length                          ${count}
                FOR    ${i}   IN RANGE    1    ${Length}+1  
                        Wait For Elements State                ((${pnl_list_episode})\[${season}]${img_list_episode})\[${i}]          visible
                        Wait For Elements State                ((${pnl_list_episode})\[${season}]${icn_view_list_episode})\[${i}]     visible
                        ${name_episode}=  Get Text             ((${pnl_list_episode})\[${season}]${lbl_name_list_episode})\[${i}]        
                        ${name_episode}   Should Match Regexp  ${name_episode}         .+
                        ${check_subscribe}     Run Keyword And Return Status   
                        ...    Wait For Elements State    (${pnl_list_episode})\[${season}]${lst_carusel_data_column}\[${i}]${lbl_subscribe_list_episode}    visible    1s
                        IF          ${check_subscribe} == ${True}
                                    Log    ${\n}Video has subscribe button.    console=${True}
                                    ${subscribe}=      Get Text                       
                                    ...    ((${pnl_list_episode})\[${season}]${lst_carusel_data_column}\[${i}]${lbl_subscribe_list_episode})    
                                    ${subscribe}    Should Match Regexp    ${subscribe}          .+ 
                        ELSE
                                    Log    ${\n}No subscribe button but has duration time video.    console=${True}
                                    ${duration_time}=      Get Text                   
                                    ...    ((${pnl_list_episode})\[${season}]${lst_carusel_data_column}\[${i}]${lbl_duration_time_list_detail})       
                                    ${duration_time}    Should Match Regexp    ${duration_time}      .+
                        END
                        ${view}=     Get Text              ((${pnl_list_episode})\[${season}]${lbl_view_list_episode})\[${i}]         
                        ${view}      Should Match Regexp   ${view}            .+                        
                        IF    ${check_subscribe} == ${False}
                                  ${result_season}    Catenate
                                  ...    ${\n}Season = ${title_season}
                                  ...    ${\n}Episode = ${name_episode}
                                  ...    ${\n}View = ${view}
                                  ...    ${\n}Duration Time = ${duration_time}
                        ELSE
                                  ${result_season}    Catenate
                                  ...    ${\n}Season = ${title_season}.
                                  ...    ${\n}Episode = ${name_episode}.
                                  ...    ${\n}View = ${view}.
                                  ...    ${\n}Duration Time = "Not Found"
                                  ...    ${\n}Status Message = ${subscribe}.
                        END
                        Log    ${result_season}    console=${True}
                END
                Take Screenshot
                Log    ${\n}'********* [Season:${title_season} ,Summary Episode:${Length}] *********'${\n}    console=yes
            END
    ELSE
            Fail    No season.
    END
    Take Screenshot    fullPage=${True}

Open Web Ais Play Production
    Open Web Browser   ${web.home_ais_play}
    Loading Home Page Ais Play Success
    Close Popup Login With Guest Mode
    Choose Language

Open Web Ais Play 
    Open Browser    https://aisplay.ais.co.th/portal/serial/series/60196c249cd6904c7d6eb50a
    Click    //button[@class="login-type-btn guest"]
    Click    //button[@class="accept-btn"]    

Open Web Ais Play Production Not Change Language       
    Open Web Browser   ${web.home_ais_play}
    Loading Home Page Ais Play Success
    Close Popup Login With Guest Mode    