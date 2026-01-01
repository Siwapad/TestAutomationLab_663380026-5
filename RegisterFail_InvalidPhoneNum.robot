*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${SERVER}     http://localhost:7072
${LAB_PATH}   /StarterFiles/Registration.html
${BROWSER}   Chrome
${DELAY}     0.1s

*** Test Cases ***
UAT-Lab04-002-06 Invalid Phone Number
    [Documentation]    UAT-Lab04-002: Phone ไม่ถูกต้อง
    Open Browser    ${SERVER}${LAB_PATH}   ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

    Input Text    id:firstname    Somyod
    Input Text    id:lastname     Sodsai
    Input Text    id:organization  CS KKU
    Input Text    id:email    somyod@kkumail.com
    Input Text    id:phone    1234
    Click Button    id:registerButton

    Title Should Be    Registration
    Page Should Contain    Workshop Registration
    Element Text Should Be  id:errors    Please enter a valid phone number, e.g., 081-234-5678, 084 234 5678, or 081.234.5678

    Close Browser