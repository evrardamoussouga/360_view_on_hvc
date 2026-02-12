*** Settings ***
Documentation       Resource file for Dynamic Dashboard related keywords

Resource            ./common.resource


*** Keywords ***
I am on the Dynamic Dashboard page
    [Documentation]    Verify that the user is on the Dynamic Dashboard page
    I see start date input
    I see end date input
    Fail    Not implemented yet
