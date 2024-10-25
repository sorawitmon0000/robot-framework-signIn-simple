*** Settings ***
Documentation    Validate login form
Library    SeleniumLibrary
Test Setup    open the browser with url
Test Teardown    Close Browser session
Resource    resouce.robot

*** Test Cases ***
Validate UnSuccessful Login
    fill the login form    ${USERNAME}    ${PASSWORD_INVALID} 
    wait until element show in page    ${SHOW_MESSAGE}
    verify error message is correct
Validate text display log in success
    fill the login form    ${USERNAME}    ${PASSWORD_VALID}    
    wait until element show in page    ${SUCCESS_PAGE_LOAD}  
    verify message login is correct

*** Variables ***
${SHOW_MESSAGE}    css:.show
${SUCCESS_PAGE_LOAD}    css:.menu
${TITLE_RESULT}    css:.post-title

*** Keywords ***
fill the login form
    [arguments]    ${USERNAME}    ${PASSWORD}
    Input Text    id:username    ${USERNAME}
    Input Password    id:password    ${PASSWORD}
    Click Button    submit

wait until element show in page
    [arguments]    ${element}
    Wait Until Element Is Visible    ${element}

verify error message is correct
    ${result}=    Get Text    ${SHOW_MESSAGE} 
    Should Be Equal As Strings    ${result}    Your password is invalid!
    Element Text Should Be    ${SHOW_MESSAGE}    Your password is invalid!

verify message login is correct
    Element Text Should Be    ${TITLE_RESULT}    ${MESSAGE_LOGIN_SUCCESS}


