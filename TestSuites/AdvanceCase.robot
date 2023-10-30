*** Settings ***
Resource        ./resource_init.robot
# Suite Setup     Open Web Ais Play Production
Test Teardown   Close Browser    ALL 
*** Test Cases ***
Hard 3
    Open Browser     https://aisplay.ais.co.th/portal/get_section/602b8c522e3c18739a994805/    
    Click    //button[@class="login-type-btn guest"]
    Click    //button[@class="accept-btn"]
    ${Elements}    Get Elements    //div[@class='container-fluid bg-block py-3 px-3 px-md-5 rounded-bottom-0']
    ${Length}    Get Length    ${Elements}
    # Log     ${Elements}    console=yes
    FOR     ${index}    IN RANGE    1    ${Length}+2
    #ดึง text list EP.
        ${Ep_List}    Get Text    (//div[@class='container-fluid bg-block py-3 px-3 px-md-5 rounded-bottom-0'])[${index}]//h2
        Scroll By        vertical=50%    horizontal=0%    behavior=smooth
        Scroll To Element    //div[@class="area-block"]//h2[normalize-space(text())="${Ep_List}"]
        Log     ${Ep_List}    console=yes    
        Should Match Regexp    ${Ep_List}    .+        
        ${Elements}    Get Elements    //h2[@class="default-title pro-carousel-component-title" and normalize-space(text())="${Ep_List}"]/..//..//div[@class="carousel-card-text-block"]
        ${Length}    Get Length    ${Elements}
        FOR     ${i}    IN RANGE    1    ${Length}+1
        #     #ดึง text แต่ละ episode   
            ${Episode}    Get Text    //h2[@class="default-title pro-carousel-component-title" and normalize-space(text())="${Ep_List}"]/..//..//div[@component-key="${i}"]//h3
            Wait For Elements State    //div[@component-key="${i}"]//div[@title="${Episode}"]//img    visible        #รูป poster แต่ละ Episode
            Should Match Regexp    ${Episode}    .+
            Log     ${Episode}    console=yes
            # ${Subscribe}    Run Keyword And Return Status
            # ...        Wait For Elements State    
            ${VdoTime}    Get Text    //h2[@class="default-title pro-carousel-component-title" and normalize-space(text())="${Ep_List}"]/..//..//div[@component-key="${i}"]//span[@class="duration-text"]
            Should Match Regexp    ${VdoTime}    .+        
            Log     ${VdoTime}    console=yes
            ${View}    Get Text    //h2[@class="default-title pro-carousel-component-title" and normalize-space(text())="${Ep_List}"]/..//..//div[@component-key="${i}"]//div[@class="text-nowrap ml-auto pr-1 card-thumb-add"]
            Should Match Regexp    ${View}    .+        
            Wait For Elements State    //div[@component-key="${i}"]//div[@title="${Episode}"]//span[@class="far fa-eye"]    visible     #Icon eye              
            Log     ${View}    console=yes
        END
    END    

    # (//div[@class='carusel-data-list'][1]${lst_carusel_data_column})[1]//span[@class='d-block text-truncate'][(contains(text(),'สมัครสมาชิก')) or (contains(text(),'Subscribe'))]