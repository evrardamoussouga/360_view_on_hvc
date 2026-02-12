*** Settings ***
Documentation       Test suite for responsiveness and accessibility features on Login pages

Resource            ../resources/login.resource
Resource            ../resources/users.resource

Test Teardown       I close browser
Test Template       Login Page Should Be Responsive


*** Test Cases ***                                  width       height
Login Page Responsiveness at 1920x1080 (desktop)    1920        1080
Login Page Responsiveness at 1366x768 (laptop)      1366        768
Login Page Responsiveness at 1024x768 (tablet)      1024        768
Login Page Responsiveness at 375x667 (mobile)       375         667


*** Keywords ***
Login Page Should Be Responsive
    [Documentation]    Verify that the login page is responsive across different screen sizes
    [Tags]    accessibility    responsiveness
    [Arguments]    ${width}    ${height}
    Given I open browser and go to login page    ${width}    ${height}
    When I submit login form with username "${SUPER_ADMIN_USERNAME}" and password "${SUPER_ADMIN_PASSWORD}"
    Then I am on the dashboard page
