*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${SERVER}     http://localhost:7072
${LAB_PATH}   /StarterFiles/Registration.html
${BROWSER}   Chrome
${DELAY}     0.1s

*** Test Cases ***
UAT-Lab04-002-03 Empty All Name
    [Documentation]    UAT-Lab04-002: First Name และ Last Name ว่าง
    Open Browser    ${SERVER}${LAB_PATH}   ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

    Input Text    id:organization    CS KKU
    Input Text    id:email    somyod@kkumail.com
    Input Text    id:phone    091-001-1234
    Click Button    id:registerButton

    Title Should Be    Registration
    Page Should Contain    Workshop Registration
    Element Text Should Be  id:errors    Please enter your name!!

    Close Browser

UAT-Lab04-002-03 Empty Email
    [Documentation]    UAT-Lab04-002: Email ว่าง
    Open Browser    ${SERVER}${LAB_PATH}   ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

    Input Text    id:firstname    Somyod
    Input Text    id:lastname     Srisuk
    Input Text    id:organization  CS KKU
    Input Text    id:phone         091-001-1234
    Click Button    id:registerButton

    Title Should Be    Registration
    Page Should Contain    Workshop Registration
    Element Text Should Be  id:errors    Please enter your email!!

    Close Browser