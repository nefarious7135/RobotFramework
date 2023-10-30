*** Variables ***
${lbl_login_guest}                    //button[@class="login-type-btn guest"]//span[text()="I’m a Guest" or text()="เข้าใช้งานแบบไม่ลงทะเบียน"]
${btn_login}                          //button[@class="login-type-btn login"]
${btn_accept}                         //button[@type="button" and @class="accept-btn"]/span/span[normalize-space(text())='ตกลง' or normalize-space(text())='Accept']

# Login Page Web AIS PLAY PORD
${img_login_switch_en}                      //img[@id='switch_lang_en']
${img_login_switch_th}                      //img[@id='switch_lang_th']
${img_login_switch_en_disabled}             //img[@id='switch_lang_en' and @style="display: none;"]
${img_login_switch_th_disabled}             //img[@id='switch_lang_th' and @style="display: none;"]
${lbl_login_green}                     //span[@id='text-green']
${txt_mobile_no}                       //input[@id='mobileNo']
${btn_req_otp}                         //button[@id='reqOpt']
${txt_otp}                             //input[@id="otp" and @type="password"]
${btn_otp_ok}                          //button[@id="loginbyOTP" and @type="button"] 
${btn_otp_ok_disabled}                 //button[@id="loginbyOTP" and @type="button" and @disabled="disabled"]
${pnl_error_invalid}                   //div[@class="alert alert-danger loginError"]
${lbl_error_invalid}                   //span[@class="msg-error"] 
${btn_get_otp_again}                   //a[@id="reqOptAgain" and (normalize-space(text())="รับ OTP อีกครั้ง" or normalize-space(text())="Get OTP again")]
