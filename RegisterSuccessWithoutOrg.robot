*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${SERVER}     http://localhost:7072
${LAB_PATH}   /StarterFiles/Registration.html
${BROWSER}   Chrome
${DELAY}     0.1s

*** Test Cases ***
UAT-Lab04-001-02 Register Success Without Organization
    [Documentation]    UAT-Lab04-001: ลงทะเบียนสำเร็จโดยไม่ระบุหน่วยงาน
    Open Browser    ${SERVER}${LAB_PATH}   ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

    Input Text    id:firstname    Somyod
    Input Text    id:lastname    Sodsai   
    Input Text    id:email    somyod@kkumail.com
    Input Text    id:phone    091-001-1234

    Capture Page Screenshot    RegisterWithoutOrg1.png

    Click Button    id:registerButton

    Title Should Be    Success
    Page Should Contain    Thank you for registering with us.
    Page Should Contain    We will send a confirmation to your email soon.

    Capture Page Screenshot    RegisterWithoutOrg2.png

    Close Browser