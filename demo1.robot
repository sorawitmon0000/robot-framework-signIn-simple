*** Settings ***
Documentation    Validate login form
Library    SeleniumLibrary
Test Teardown    Close Browser
#Resource

*** Test Cases ***
Validate UnSuccessful Login
    open the browser with url
    fill the login form
    wait until it checks and display error message
    verify error message is correct

*** Variables ***
${LOGIN URL}    https://practicetestautomation.com/practice-test-login/
${BROWSER}    chrome
${DELAY}    1
${SHOW_MESSAGE}    css:.show

*** Keywords ***
open the browser with url
    Open Browser    ${LOGIN URL}    ${BROWSER}
fill the login form
    Input Text    id:username    student
    Input Password    id:password    password123
    Click Button    submit
wait until it checks and display error message
    Wait Until Element Is Visible    ${SHOW_MESSAGE} 
verify error message is correct
    ${result}=    Get Text    ${SHOW_MESSAGE} 
    Should Be Equal As Strings    ${result}    Your password is invalid!
    Element Text Should Be    ${SHOW_MESSAGE}    Your password is invalid!

