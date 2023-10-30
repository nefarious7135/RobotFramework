//span[contains(text(),'ภูเก็ต')]
//span[normalize-space(text())='เข้าสู่ระบบ']
//div[contains(concat('',normalize-space(@class),''),'vjs-volume-panel')]
//span[text()="Language" or text()="ภาษา"]/../..//button[contains(concat(' ',normalize-space(@class),' '),'active')]
//button[normalize-space(text())="English" and contains(concat(' ',normalize-space(@class),' '),'active')]
//span[normalize-space(text())='HOME' or normalize-space(text())='หน้าแรก']
//span[(text()="Settings") or (text()="การตั้งค่า")]
กรุ๊ป xpath
(//div[@class="k-list-content k-list-scroller"]//span)[1]
(//ul[@class="vjs-menu-content"]//li[@class="vjs-menu-item"]//span[@class="short-b-label"])

tagname ใน mobile คือ class
//div[contains(@attribute,'value')]   กรณีเปลี่ยนคำตลอด
//div[span[@attribute='value']]//tagname   ค่าเป็นtext tagname ซ้ำ
//div[span[text()='value']]//tagname    ค่าเป็นtext tagname ซ้ำ
//div[@attribute='value' and @attribute='value']    กรณีattributeซ้ำกันเพิ่มattributeอีกได้
//android.widget.RadioButton[@index='0']
//tagname[@text='value']    กรณีค้นหาคำ

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
