*** Settings ***
Documentation       Resource file for RM View related keywords

Resource            ./common.resource


*** Keywords ***
I am on the RM View page
    [Documentation]    Verify that the user is on the RM View page
    I see start date input
    I see end date input
    Fail    Not implemented yet
