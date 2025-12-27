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
UAT-Lab04-002-05 Empty Phone
    [Documentation]    Phone ว่าง
    Go To Registration Page
    Input Text    id:firstname    Somyod
    Input Text    id:lastname     Sodsai
    Input Text    id:organization  CS KKU
    Input Text    id:email    somyod@kkumail.com
    Click Button    id:registerButton

    Title Should Be    Registration
    Page Should Contain    Workshop Registration
    Element Text Should Be  id:errors    Please enter your phone number!!

    Close Browser