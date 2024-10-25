*** Settings ***
Documentation    A resource file with reusable keywords and variables.
Library    SeleniumLibrary

*** Variables ***
${LOGIN URL}    https://practicetestautomation.com/practice-test-login/
${BROWSER}    chrome
${DELAY}    1
${USERNAME}    student
${PASSWORD_INVALID}    password123
${PASSWORD_VALID}    Password123
${MESSAGE_LOGIN_SUCCESS}    Logged In Successfully

*** Keywords ***
open the browser with url
    Open Browser    ${LOGIN URL}    ${BROWSER}
Close Browser session
    Close Browser