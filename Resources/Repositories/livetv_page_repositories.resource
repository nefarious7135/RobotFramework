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

#Live TV Page
${pnl_tvprogram_guides}                   xpath=//h2[@class="list-wrapper-title py-3 px-3 my-0"]/span[text()="ผังรายการทีวี" or text()="TV Program Guides"]
${lbl_livetv_channel_active}              //div[@class="row mx-0 flex-nowrap channel-item w-100 active"]//div[@class="col-1 pr-0 d-flex justify-content-start align-items-center" and normalize-space(text())]     
${lbl_livetv_channel_nameactive}          //div[@class="row mx-0 flex-nowrap channel-item w-100 active"]//span[@class="channel-item-title text-truncate" and normalize-space(text())]  
${img_logo_channel_active}                //div[@class="row mx-0 flex-nowrap channel-item w-100 active"]//div[@class="responsive-content"]/img  
${lbl_channel}                            //div[@class="col-1 pr-0 d-flex justify-content-start align-items-center"]
