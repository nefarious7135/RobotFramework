*** Settings ***
Resource    ../../TestSuites/resource_init.robot

*** Keywords ***
Verify For Search Results
    [Documentation]    Owner: Kachain.a   
    [Tags]    keyword_action 
    Wait For Elements State    ${lbl_result_for}               visible
    Verify Text On Elements    ${lbl_result_for}               ${results_for}
    Verify Text On Elements    ${lbl_result_for_value}         ${TEXT_SEARCH}
    Take Screenshot            fullPage=${True}

Verify Search On Section Movie
    [Documentation]    Owner: Kachain.a
    [Tags]             keyword_action
    Wait For Elements State       ${pnl_section_movie}      visible
    ${status}    Run Keyword And Return Status    Wait For Elements State    ${lbl_movie_name}\[1][contains(text(), '${TEXT_SEARCH}')]    visible
    IF  ${status}==${True}
        ${expectName}             Get Text             ${lbl_movie_name}\[1][contains(text(), '${TEXT_SEARCH}')]
        Log                       ${expectName}        console=${True}
        Set Suite Variable        ${EXPECTNAME}        ${expectName}
        Click                     ${lbl_movie_name}\[1][contains(text(), '${TEXT_SEARCH}')]
        Verify Movie Page
    ELSE
        Fail     "กรุณาเช็ค Movies ของคุณอีกครั้ง"
    END

Verify Movie Page
    [Documentation]    Owner: Kachain.a
    [Tags]             keyword_action
    Wait For Elements State       ${lbl_title_name}      visible
    Verify Text On Elements       ${lbl_title_name}      ${EXPECTNAME}  
    Take Screenshot    fullPage=${True}

    