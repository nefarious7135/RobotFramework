*** Variables ***
#Side Menu
${msg_home_sidemenu}                             HOME 
${msg_premium_member_sidemenu}                   PREMIUM MEMBER
${msg_live_tv_sidemenu}                          LIVE TV
${msg_live_sports_sidemenu}                      LIVE SPORTS
${msg_sports_sidemenu}                           SPORTS
${msg_series_sidemenu}                           SERIES
${msg_movies_sidemenu}                           MOVIES
${msg_anime_sidemenu}                            ANIME
${msg_kids_family_sidemenu}                      KIDS & FAMILY
${msg_music_sidemenu}                            MUSIC
${msg_packages_sidemenu}                         PACKAGES
${msg_other_app_sidemenu}                        OTHER APP
${msg_settings_sidemenu}                         SETTINGS  



@{list_msg_sidemenu}         
...    ${msg_home_sidemenu}
...    ${msg_premium_member_sidemenu}
...    ${msg_live_tv_sidemenu}
...    ${msg_live_sports_sidemenu}
...    ${msg_sports_sidemenu}
...    ${msg_series_sidemenu}
...    ${msg_movies_sidemenu}
...    ${msg_anime_sidemenu}
...    ${msg_kids_family_sidemenu}
...    ${msg_music_sidemenu}
...    ${msg_packages_sidemenu}
...    ${msg_other_app_sidemenu}
...    ${msg_settings_sidemenu}


${msg_relateitems}                          Related items
${msg_logout}                               Logout
${msg_login}                                Login
${msg_setting_settings}                     Settings
${msg_my_profile_settings}                  My Profile
${msg_my_account_settings}                  My Account
${msg_my_perferences}                       My Preferences 
${msg_language_settings}                    Language
${msg_perferred_audio_language_settings}    Preferred audio language
${msg_terms_and_conditions_settings}        Terms and Conditions 
${msg_thai_settings}                        ไทย
${msg_english_settings}                     English

@{list_msg_settings}         
...    ${msg_setting_settings}     
...    ${msg_my_profile_settings}    
...    ${msg_my_account_settings}
...    ${msg_my_perferences}    
...    ${msg_language_settings}    
...    ${msg_perferred_audio_language_settings}    
...    ${msg_terms_and_conditions_settings}    

# Message Login
${msg_error_invalid_otp}          You have entered incorrect OTP. Please try again.

# Message Search
${msg_search_not_found_movies}    Not found Movies with keywords:

# Search Page
${msg_header_result_search}    Results for:

${msg_settings_en}                    Settings
${msg_my_profile_en}                  My Profile
${msg_my_account_en}                  My Account
${results_for}                        Results for:
${search_name}                        Over Drive
${menu_name}                          SPORTS
${Reg_sideMenu}                       [A-Z]+\\s.\\s[A-Z]+|[A-Z]+|[A-Z]+\\s[A-Z]+
${Reg_Eplist}                         [A-Z]{2}.[0-9]+.[0-9]+
${Reg_Episode}                        [A-Z]{1}[a-z]+\\s[0-9]+\\s.[0-9+].[0-9+].|^[A-Z]{1}[a-z]+\\s[0-9]+\\s.[0-9+].[0-9+].\\s.\\s[A-Z]{1}[a-z]+
${Reg_view}                           \\s[0-9]+[k|m]$
${Reg_time}                           [0-9]+:[0-9]+$