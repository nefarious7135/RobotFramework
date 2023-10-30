*** Settings ***
Resource        ./resource_init.robot
Resource        ../TestSuites/keywordAndVariables/keywordAndVariables.robot

*** Test Cases ***
TST_F1_1_1_1
    Open Browser Proect LDAP  
    Verify Login Success                 
    Click    //span[@class="truncate mr-3 select-none" and (text()="Customer")]
    Click    //span[@class="truncate mr-3 select-none" and (text()="Account")]
    Click    (//span[@class="truncate mr-3 select-none" and (text()="Account")]//..//..//..//ul//li)[3]
    Sleep    5s
    Wait For Elements State    //div[@class="vx-card__body"]    visible
    Click    //div[@class="v-select vs--searchable"]
    Sleep    2s
    ${Elements}    Get Elements   //div[@class="vs__selected-options"]
    # Hover     //ul[@id="vs1__listbox"]
    # ${selected} =    Select Options By    select[name=Completed]    index    0    1
    # List Should Contain Value    ${selected}    0
    # List Should Contain Value    ${selected}    1
    Log    ${Elements}    console=yes
    # Click    //div[@class="vs__selected-options"][1]
    # Sleep    5s

    
    
    
    

    # //ul[@id="vs1__listbox" and @class="vs__dropdown-menu"] 
    # //ul[@class="vs__dropdown-menu"]
    # //div[@class="vs__selected-options" @aria-activedescendant="vs1__option-1"]
    # //input[@class="vs__search"]
   

