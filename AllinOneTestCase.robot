*** Settings ***
Library   SeleniumLibrary

Suite Setup   Open Browser To Registration Page

*** Variables ***
${URL}        file:///D:/MYPIC/ComSciP3T2/CP353004_Lab/TestAutomationLab_663380026-5/StarterFiles/Registration.html
${BROWSER}   Chrome
${DELAY}     0.1s

*** Keywords ***
Open Browser To Registration Page
    Open Browser    ${URL}   ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Title Should Be  Registration
    Page Should Contain    Workshop Registration

Go To Registration Page
    Go To    ${URL}
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
    [Documentation]    UAT-Lab04-001: ลงทะเบียนสำเร็จโดยระบุหน่วยงาน
    Go To Registration Page
    Input Text    id:firstname      Somyod
    Input Text    id:lastname       Sodsai
    Input Text    id:organization   CS KKU
    Input Text    id:email          somyod@kkumail.com
    Input Text    id:phone          091-001-1234
    Click Button   id:registerButton

    Title Should Be    Success
    Page Should Contain    Thank you for registering with us.
    Page Should Contain    We will send a confirmation to your email soon.

UAT-Lab04-001-02 Register Success Without Organization
    [Documentation]    UAT-Lab04-001: ลงทะเบียนสำเร็จโดยไม่ระบุหน่วยงาน
    Go To Registration Page
    Input Text    id:firstname      Somyod
    Input Text    id:lastname       Sodsai
    Input Text    id:email          somyod@kkumail.com
    Input Text    id:phone          091-001-1234
    Click Button   id:registerButton

    Title Should Be    Success
    Page Should Contain    Thank you for registering with us.
    Page Should Contain    We will send a confirmation to your email soon.


UAT-Lab04-002-01 Empty First Name
    [Documentation]    UAT-Lab04-002: First Name ว่าง
    Go To Registration Page
    Input Text    id:lastname       Sodyod
    Input Text    id:organization   CS KKU
    Input Text    id:email          somyod@kkumail.com
    Input Text    id:phone          091-001-1234
    Click Button   id:registerButton

    Title Should Be    Registration
    Page Should Contain    Workshop Registration
    Element Text Should Be    id:errors    Please enter your first name!!

UAT-Lab04-002-02 Empty Last Name
    [Documentation]    UAT-Lab04-002: Last Name ว่าง
    Go To Registration Page
    Input Text    id:firstname      Somyod
    Input Text    id:organization   CS KKU
    Input Text    id:email          somyod@kkumail.com
    Input Text    id:phone          091-001-1234
    Click Button   id:registerButton

    Title Should Be    Registration
    Page Should Contain    Workshop Registration
    Element Text Should Be    id:errors    Please enter your last name!!

UAT-Lab04-002-03 Empty First And Last Name
    [Documentation]    UAT-Lab04-002: First Name และ Last Name ว่าง
    Go To Registration Page
    Input Text    id:organization   CS KKU
    Input Text    id:email          somyod@kkumail.com
    Input Text    id:phone          091-001-1234
    Click Button   id:registerButton

    Title Should Be    Registration
    Page Should Contain    Workshop Registration
    Element Text Should Be    id:errors    Please enter your name!!

UAT-Lab04-002-04 Empty Email
    [Documentation]    UAT-Lab04-002: Email ว่าง
    Go To Registration Page
    Input Text    id:firstname      Somyod
    Input Text    id:lastname       Sodsai
    Input Text    id:organization   CS KKU
    Input Text    id:phone          091-001-1234
    Click Button   id:registerButton

    Title Should Be    Registration
    Page Should Contain    Workshop Registration
    Element Text Should Be    id:errors    Please enter your email!!

UAT-Lab04-002-05 Empty Phone Number
    [Documentation]    UAT-Lab04-002: Phone ว่าง
    Go To Registration Page
    Input Text    id:firstname      Somyod
    Input Text    id:lastname       Sodsai
    Input Text    id:organization   CS KKU
    Input Text    id:email          somyod@kkumail.com
    Click Button   id:registerButton

    Title Should Be    Registration
    Page Should Contain    Workshop Registration
    Element Text Should Be    id:errors    Please enter your phone number!!

UAT-Lab04-002-06 Invalid Phone Number
    [Documentation]    UAT-Lab04-002: Phone ไม่ถูกต้อง
    Go To Registration Page
    Input Text    id:firstname      Somyod
    Input Text    id:lastname       Sodsai
    Input Text    id:organization   CS KKU
    Input Text    id:email          somyod@kkumail.com
    Input Text    id:phone          1234
    Click Button   id:registerButton

    Title Should Be    Registration
    Page Should Contain    Workshop Registration
    Element Text Should Be    id:errors    Please enter a valid phone number, e.g., 081-234-5678, 081 234 5678, or 081.234.5678)

    Close Browser
