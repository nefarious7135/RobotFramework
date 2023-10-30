***Variables***
# Setting "Icon"
${icn_settings}                                 //main[@class="content"]//span[(text()="Settings") or (text()="การตั้งค่า")]/..//i[contains(concat(' ',normalize-space(@class),' '),'fa-cog')]
${icn_my_account_settings}                      //main[@class="content"]//span[(text()="My Profile") or (text()="ข้อมูลผู้ใช้งาน")]/../..//i[contains(concat(' ',normalize-space(@class),' '),'fa-user')]
${icn_language_settings}                        //main[@class="content"]//span[(text()="My Preferences") or (text()="การตั้งค่า")]/../..//i[contains(concat(' ',normalize-space(@class),' '),'fa-bookmark')]
${icn_preferred_audio_language_settings}        //main[@class="content"]//span[(text()="Preferred audio language") or (text()="เสียงที่ต้องการ")]/../..//span[contains(concat(' ',normalize-space(@class),' '),'fa-stack')]
${icn_terms_and_conditions_settings}            //main[@class="content"]//span[(normalize-space(text())="Terms and Conditions") or (normalize-space(text())="ข้อตกลงและเงื่อนไขการใช้บริการ")]/..//span[contains(concat(' ',normalize-space(@class),' '),'fa-stack')]

# Setting "Icon"
@{list_icon_setting}          
...    ${icn_settings}       
...    ${icn_my_account_settings}             
...    ${icn_language_settings}    
...    ${icn_preferred_audio_language_settings}
...    ${icn_terms_and_conditions_settings}   

# Setting "Title"
${lbl_settings}                                 //main[@class="content"]//span[(text()="Settings") or (text()="การตั้งค่า")]
${lbl_my_profile_settings}                      //main[@class="content"]//span[(text()="My Profile") or (text()="ข้อมูลผู้ใช้งาน")]
${lbl_my_account_settings}                      //main[@class="content"]//span[(text()="My Account") or (text()="บัญชีของฉัน")]
${lbl_my_preferences_settings}                  //main[@class="content"]//span[(text()="Settings") or (text()="การตั้งค่า")]//following::span[(text()="My Preferences") or (text()="การตั้งค่า")]
${lbl_language_settings}                        //main[@class="content"]//span[(text()="Language") or (text()="ภาษา")]
${lbl_preferred_audio_language_settings}        //main[@class="content"]//span[(text()="Preferred audio language") or (text()="เสียงที่ต้องการ")]
${lbl_terms_and_conditions_settings}            //main[@class="content"]//span[(normalize-space(text())="Terms and Conditions") or (normalize-space(text())="ข้อตกลงและเงื่อนไขการใช้บริการ")]
@{list_title_setting}          
...    ${lbl_settings}       
...    ${lbl_my_profile_settings}             
...    ${lbl_my_account_settings}    
...    ${lbl_my_preferences_settings}
...    ${lbl_language_settings}
...    ${lbl_preferred_audio_language_settings}   
...    ${lbl_terms_and_conditions_settings}

# Language "Active-Green"
${lbl_language_green_active_settings}           //span[text()="Language" or text()="ภาษา"]/../..//button[contains(concat(' ',normalize-space(@class),' '),'active')]

# Language Active "TH/EN" No "Active-Gray"
${lbl_language_english_settings}                //span[text()="Language" or text()="ภาษา"]/../..//button[normalize-space(text())="English"]
${lbl_language_thai_settings}                   //span[text()="Language" or text()="ภาษา"]/../..//button[normalize-space(text())="ไทย"]

# Language Active "TH/EN" Is "Active-Green" 
${lbl_language_english_active_settings}         //span[text()="Language" or text()="ภาษา"]/../..//button[normalize-space(text())="English" and contains(concat(' ',normalize-space(@class),' '),'active')]
${lbl_language_thai_active_settings}            //span[text()="Language" or text()="ภาษา"]/../..//button[normalize-space(text())="ไทย" and contains(concat(' ',normalize-space(@class),' '),'active')]  

${lbl_header_settings}                          //div[@class="settings-container"]/h2/span
${lbl_my_profile}                               //span[@class="block-title-container-span"]
${lbl_my_account}                               //div[@class="btn-my-account"]/span
${lbl_select_language}                          //span[text()="Language" or text()="ภาษา"]/../..//button[@class="language-select"]