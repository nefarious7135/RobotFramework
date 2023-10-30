*** Settings ***
Resource    ../../TestSuites/resource_init.robot

*** Variables ***
&{window_fullscreen_size}       width=${browser.viewport.width}    height=${browser.viewport.height}

*** Keywords ***
Open Web Browser
    [Documentation]    Owner : Patipan.w
    ...    ${browser}=chromium  ---> (Google Chrome, Microsoft Edge (since 2020), Opera)
    ...    ${browser}=firefox   ---> (Mozilla Firefox)
    ...    ${browser}=webkit    ---> (Apple Safari, Mail, AppStore on MacOS and iOS)
    ...    ${headless}=${False} ---> Run แบบแสดงหน้าต่าง Browser
    ...    ${headless}=${True}  ---> Run แบบไม่แสดงหน้าต่าง Browser
    [Tags]    keyword_action
    [Arguments]    ${url}    ${browser}=${run_browser}    ${headless}=${False}    
    ...    ${accept_download}=${True}    ${ignore_ssl_certificate}=${False}    ${viewport}=&{window_fullscreen_size}
    # ...    ${permissions}=${None} 
    ${active_context_list}      Create List
    ${active_context_length}    Get Length            ${active_context_list}
    IF    ${active_context_length} == 0
        New Browser
        ...    browser=${browser}
        ...    headless=${headless}
    END
    ${id_context}    New Context
    ...    acceptDownloads=${accept_download}
    ...    ignoreHTTPSErrors=${ignore_ssl_certificate}
    ...    viewport=${viewport}
    # ...    permissions=${permissions}
    Append To List        ${active_context_list}    ${id_context}
    Set Suite Variable    ${CURRENT_CONTEXT}        ${active_context_list}
    Set Browser Timeout    60s
    New Page    ${url} 

Switch Browser
    [Documentation]    Owner : Patipan.w
    [Tags]    keyword_action
    [Arguments]    ${context_index}
    Switch Context        ${CURRENT_CONTEXT}[${${context_index} - 1}]