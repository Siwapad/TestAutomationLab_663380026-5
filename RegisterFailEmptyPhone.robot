*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${SERVER}     http://localhost:7072
${LAB_PATH}   /StarterFiles/Registration.html
${BROWSER}   Chrome
${DELAY}     0.1s

*** Test Cases ***
UAT-Lab04-002-05 Empty Phone
    [Documentation]    UAT-Lab04-002: Phone ว่าง
    Open Browser    ${SERVER}${LAB_PATH}   ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

    Input Text    id:firstname    Somyod
    Input Text    id:lastname     Sodsai
    Input Text    id:organization  CS KKU
    Input Text    id:email    somyod@kkumail.com
    Click Button    id:registerButton

    Title Should Be    Registration
    Page Should Contain    Workshop Registration
    Element Text Should Be  id:errors    Please enter your phone number!!

    Close Browser