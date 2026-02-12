*** Settings ***
Documentation       Resource file for Supervision View related keywords

Resource            ./common.resource


*** Keywords ***
I am on the Supervision View page
    [Documentation]    Verify that the user is on the Supervision View page
    I see start date input
    I see end date input
    Fail    Not implemented yet
