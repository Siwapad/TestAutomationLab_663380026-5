*** Settings ***
Library   SeleniumLibrary

Suite Setup   Open Browser To Registration Page

*** Variables ***
${SERVER}     http://localhost:7072
${LAB_PATH}   /Registration.html
${BROWSER}   Chrome
${DELAY}     0.1s

*** Keywords ***
Open Browser To Registration Page
    Open Browser    ${SERVER}${LAB_PATH}   ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Title Should Be  Registration
    Page Should Contain    Workshop Registration

Go To Registration Page
    Go To    ${SERVER}${LAB_PATH}
    Title Should Be  Registration
    Page Should Contain    Workshop Registration
    Clear Element Text    id:firstname
    Clear Element Text    id:lastname
    Clear Element Text    id:organization
    Clear Element Text    id:email
    Clear Element Text    id:phone
    Run Keyword And Ignore Error    Clear Element Text    id:errors

*** Test Cases ***
UAT-Lab04-001-01 Register Success With Organization
    [Documentation]    UAT-Lab01-001: ลงทะเบียนสำเร็จโดยระบุหน่วยงาน
    Go To Registration Page
    Input Text    id:firstname    Somyod
    Input Text    id:lastname    Sodsai
    Input Text    id:organization    CS KKU
    Input Text    id:email    somyod@kkumail.com
    Input Text    id:phone    091-001-1234
    Click Button    id:registerButton

    Title Should Be    Success
    Page Should Contain    Thank you for registering with us.
    Page Should Contain    We will send a confirmation to your email soon.

    Close Browser

