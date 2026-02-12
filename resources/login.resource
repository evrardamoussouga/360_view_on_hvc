*** Settings ***
Documentation       Resource file for login tests

Resource            ./common.resource
Resource            ./dashboard.resource


*** Variables ***
${LOGIN_URL}    https://example.com/login


*** Keywords ***
I go to login page
    [Documentation]    Navigate to the login page
    Go To    ${LOGIN_URL}

I open browser and go to login page
    [Documentation]    Open browser and navigate to login page
    [Arguments]    ${width}=1920    ${height}=1080
    I open browser to url "${LOGIN_URL}"    ${width}    ${height}

I am on login page
    [Documentation]    Verify that we are on the login page
    Fail    Verification of login page not implemented yet

I enter username "${username}"
    [Documentation]    Enter the username
    Fail    Entering username not implemented yet

I enter password "${password}"
    [Documentation]    Enter the password
    Fail    Entering password not implemented yet

I fill in login form with username "${username}" and password "${password}"
    [Documentation]    Fill in the login form with provided username and password
    I enter username "${username}"
    I enter password "${password}"

I clear login form fields
    [Documentation]    Clear the login form fields
    I fill in login form with username "${EMPTY}" and password "${EMPTY}"

I click login button
    [Documentation]    Click the login button
    Fail    Clicking login button not implemented yet

I submit login form with username "${username}" and password "${password}"
    [Documentation]    Submit the login form with provided username and password
    I am on login page
    I fill in login form with username "${username}" and password "${password}"
    I click login button

I login with username "${username}" and password "${password}"
    [Documentation]    Perform login with provided username and password
    I submit login form with username "${username}" and password "${password}"
    I am on the dashboard page
