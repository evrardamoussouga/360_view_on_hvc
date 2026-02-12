*** Settings ***
Documentation       Resource file for Reporting related keywords

Resource            ./common.resource


*** Keywords ***
I am on the Reportings page
    [Documentation]    Verify that the user is on the Reportings page
    I see start date input
    I see end date input
    Fail    Not implemented yet
