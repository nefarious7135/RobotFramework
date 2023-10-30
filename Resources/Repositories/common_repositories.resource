*** Variables ***
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

# Home Page - Navbar Header
${btn_login_popup}                        //button[@class="login-type-btn login"]//span[normalize-space(text())="Login" or normalize-space(text())="เข้าสู่ระบบ"]
${btn_login_home}                         //a[@class="nav-link link-login" and normalize-space(text())="Login" or normalize-space(text())="เข้าสู่ระบบ"]
${btn_logout_home}                        //a[@class="nav-link link-login" and normalize-space(text())="Logout" or normalize-space(text())="ออกจากระบบ"]
${btn_hamberger}                          //button[@class="navbar-toggler nav-heading-toogle"]/img
${pnl_footer}                             //div[@id="ais_footer"]
${lbl_ais_footer}                         //div[@class="ais_footer-nav"]
${img_logo_header_aisplay}                //div[@class="nav-heading"]//img[@alt="AIS PLAY"]
${btn_search}                             //button[@class="btn form-search-btnsearch not-focusable rounded-left"]
${btn_active_search}                      //button[@class="btn form-search-btnsearch not-focusable active"]
${txt_search}                             //input[@type="text" and @class="form-control form-search-input-form"]

# Home Page - Pnl SideMenu
${pnl_hamberger}                          //div[@class="side-bar-container"]//aside[@class="side-bar-aside"]
${icn_logo_ais_side_menu}                 //div[@class="side-bar-title-fixed"]//img[contains(concat(' ',normalize-space(@src),' '),'ais_play.e9f424a5.png') and @alt="PRO TV PLUS"]
${btn_close_side_menu}                    //div[@class="side-bar-title-fixed"]//button[@type="button" and @class="side-bar-title-fixed-close"]//span

# Home Page - Icn SideMenu
${lst_icon_sidemenu}                      (//ul[@class="side-bar-list"]//img)
${icn_home_sidemenu}                      //ul[@class="side-bar-list"]//img[@alt="HOME" or @alt="หน้าแรก"]
${icn_livetv_sidemenu}                    //ul[@class="side-bar-list"]//img[@alt="LIVE TV" or @alt="ทีวี"]
${icn_sports_sidemenu}                    //ul[@class="side-bar-list"]//img[@alt="SPORTS" or @alt="กีฬา"]
${icn_series_sidemenu}                    //ul[@class="side-bar-list"]//img[@alt="SERIES" or @alt="ซีรีย์"]
${icn_movies_sidemenu}                    //ul[@class="side-bar-list"]//img[@alt="MOVIES" or @alt="ภาพยนตร์"]
${icn_anime_sidemenu}                     //ul[@class="side-bar-list"]//img[@alt="ANIME" or @alt="อนิเมะ"]
${icn_kids_and_family_sidemenu}           //ul[@class="side-bar-list"]//img[@alt="KIDS & FAMILY" or @alt="เด็กและครอบครัว"]
${icn_music_sidemenu}                     //ul[@class="side-bar-list"]//img[@alt="MUSIC" or @alt="ดนตรี"]
${icn_packeges_sidemenu}                  //ul[@class="side-bar-list"]//img[@alt="PACKAGES" or @alt="แพ็กเกจ"]
${icn_other_app_sidemenu}                 //ul[@class="side-bar-list"]//img[@alt="OTHER APP" or @alt="แอป อื่นๆ"]
${icn_setting_sidemenu}                   //ul[@class="side-bar-list"]//img[@alt="SETTINGS" or @alt="ตั้งค่า"]
${icn_premium_member_sidemenu}             //ul[@class="side-bar-list"]//img[@alt="PREMIUM MEMBER" or @alt="สมาชิกพรีเมียม"]
${icn_live_sports_sidemenu}                //ul[@class="side-bar-list"]//img[@alt="LIVE SPORTS" or @alt="ดูสดกีฬา"]

# Home Page - Lbl SideMenu   
${lst_menu_sidemenu}                       (//ul[@class="side-bar-list"]/li/a/span)
${mnu_home_sidemenu}                       //ul[@class="side-bar-list"]//span[text()='หน้าแรก' or text()='HOME']
${mnu_livetv_sidemenu}                     //ul[@class="side-bar-list"]//span[text()="ทีวี" or text()="LIVE TV"]
${mnu_sports_sidemenu}                     //ul[@class="side-bar-list"]//span[text()="กีฬา" or text()="SPORTS"]
${mnu_series_sidemenu}                     //ul[@class="side-bar-list"]//span[text()='ซีรีส์' or text()='SERIES']
${mnu_movies_sidemenu}                     //ul[@class="side-bar-list"]//span[text()='ภาพยนตร์' or text()='MOVIES']
${mnu_anime_sidemenu}                      //ul[@class="side-bar-list"]//span[text()='อนิเมะ' or text()='ANIME']
${mnu_kids_and_family_sidemenu}            //ul[@class="side-bar-list"]//span[text()='เด็กและครอบครัว' or text()='KIDS & FAMILY']
${mnu_music_sidemenu}                      //ul[@class="side-bar-list"]//span[text()='ดนตรี' or text()='MUSIC']
${mnu_packages_sidemenu}                   //ul[@class="side-bar-list"]//span[text()='แพ็กเกจ' or text()='PACKAGES']
${mnu_otherapp_sidemenu}                   //ul[@class="side-bar-list"]//span[text()='แอป อื่นๆ' or text()='OTHER APP']
${mnu_settings_sidemenu}                   //ul[@class="side-bar-list"]/li/a/span[text()="ตั้งค่า" or text()="SETTINGS"]
${mnu_premium_member_sidemenu}             //ul[@class="side-bar-list"]//span[text()="PREMIUM MEMBER" or text()="สมาชิกพรีเมียม"]    
${mnu_live_sports_sidemenu}                //ul[@class="side-bar-list"]//span[text()="LIVE SPORTS" or text()="ดูสดกีฬา"]   

# Home Page - List "Icon" - "Sidemenu"
@{list_icon_sidemenu}          
...    ${icn_home_sidemenu}       
...    ${icn_livetv_sidemenu}             
...    ${icn_sports_sidemenu}    
...    ${icn_series_sidemenu}
...    ${icn_movies_sidemenu}         
...    ${icn_anime_sidemenu}      
...    ${icn_kids_and_family_sidemenu}    
...    ${icn_music_sidemenu}     
...    ${icn_packeges_sidemenu}
...    ${icn_other_app_sidemenu}      
...    ${icn_setting_sidemenu}    
...    ${icn_logo_ais_side_menu}          
...    ${btn_close_side_menu}

# Home Page - List "Menu" - "Sidemenu"
@{list_menu_sidemenu}          
...    ${mnu_home_sidemenu}       
...    ${mnu_livetv_sidemenu}             
...    ${mnu_sports_sidemenu}    
...    ${mnu_series_sidemenu}
...    ${mnu_movies_sidemenu}         
...    ${mnu_anime_sidemenu}      
...    ${mnu_kids_and_family_sidemenu}    
...    ${mnu_music_sidemenu}     
...    ${mnu_packages_sidemenu}
...    ${mnu_otherapp_sidemenu}       
...    ${mnu_settings_sidemenu}   

# Result Search
${lbl_message_search_movies}               //h2[@class="default-title mb-3" and text()="Movies"]/..//span[1]
${lbl_results_search_not_found_movies}     //h2[@class="default-title mb-3" and text()="Movies"]/..//span[@class="search-result-not-query-overflowed"]
${lbl_header_result_search}                //h1[@class="default-title mb-3"]/span[text()="ผลลัพธ์:" or text()="Results for:"]
${lbl_header_value_search}                 //h1[@class="default-title mb-3"]/span[@class="search-result-not-query-overflowed"]