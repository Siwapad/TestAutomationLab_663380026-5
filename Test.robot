*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SERVER}     http://localhost:7072
${LAB_PATH}   /StarterFiles/Registration.html
${BROWSER}   Chrome
${DELAY}     0.1s

*** Test Cases ***
Lab Demo Test Case
    [Documentation]    This is a demo test case for lab purposes.
    Open Browser    ${SERVER}${LAB_PATH}   ${BROWSER}
    Set Selenium Speed    ${DELAY}
    Title Should Be  Registration
    Page Should Contain    Workshop Registration

    Input Text    id:firstname    John
    Input Text    id:lastname    Doe
    Input Text    id:organization    ExampleOrg
    Input Text    id:email    johndoe@email.con
    Input Text    id:phone    123-456-7890

    Capture Page Screenshot    Test1.png

    Click Button    id:registerButton

    Title Should Be    Success
    Page Should Contain    Thank you for registering with us.
    Page Should Contain    We will send a confirmation to your email soon.

    Capture Page Screenshot    Test2.png

    Close Browser