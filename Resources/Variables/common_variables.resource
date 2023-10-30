*** Variables ***
${var}    var
${VDO_player}    //iframe[@id="video_player"]
${before_hover}    //span[@class="k-picker k-dropdownlist form-control k-picker-solid k-picker-md k-rounded-md k-invalid"]
${after_hover}    //span[@class="k-picker k-dropdownlist form-control k-picker-solid k-picker-md k-rounded-md k-invalid k-hover"]
${BeforeVolumeHover}    //div[@class="vjs-volume-bar vjs-slider-bar vjs-slider vjs-slider-horizontal"]
${afterVolumeHover}    //div[@class="vjs-volume-panel vjs-control vjs-volume-panel-horizontal vjs-hover"]
${Wat_Rsl}    //button[@class="vjs-menu-button vjs-menu-button-popup vjs-icon-cog vjs-button" and @aria-expanded="true"]
${tex_Rsl}    (//ul[@class="vjs-menu-content"]//li[@class="vjs-menu-item"]//span[@class="short-b-label"])
${btn_Rsl}    //button[@class="vjs-menu-button vjs-menu-button-popup vjs-icon-cog vjs-button" and @type="button"]
${Ele_Rsl}    //div[@class="vjs-menu vjs-lock-showing"]//li[@class="vjs-menu-item"]
${ShowRsl}    //button[@class="vjs-menu-button vjs-menu-button-popup vjs-icon-cog vjs-button" and @aria-expanded="true"]
${lbl_Rsl}    //span[@class="vjs-menu-item-text"]//span[@class="short-b-label"]
${lst_cha}    //div[@class="container-fluid bg-block list-wrapper px-0"]//div[@class="row mx-0 flex-column w-100 col-12 mx-0 px-0"]
${lst_txt_cha}    //div[@class="row mx-0 flex-column w-100 col-12 mx-0 px-0"]//div[@class="col-1 pr-0 d-flex justify-content-start align-items-center"]


${Resolution_1}    1080p
${Resolution_2}    720p
${Resolution_3}    480p
${Resolution_4}    360p
${Resolution_5}    270p

@{Resolution_xxP}    
...    ${Resolution_1}    
...    ${Resolution_2}    
...    ${Resolution_3}     
...    ${Resolution_4}     
...    ${Resolution_5}  
