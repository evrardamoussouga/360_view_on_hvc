*** Settings ***
Documentation       Test suite to verify system access by a specific authorized user

Resource            ../resources/login.resource
Resource            ../resources/users.resource

Test Setup          I open browser and go to login page
Test Teardown       I close browser
Test Template       Verify System Access by Specific User


*** Test Cases ***                      username                                password                                access_form     rm_view     supervision_view    dynamic_dashboard       reportings
Verify Access for HVC RM Team User      ${USER_FROM_HVC_RM_TEAM_USERNAME}       ${USER_FROM_HVC_RM_TEAM_PASSWORD}       ${True}         ${True}     ${True}             ${True}                 ${True}
Verify Access for EXCO member           ${USER_FROM_EXCO_TEAM_USERNAME}         ${USER_FROM_EXCO_TEAM_PASSWORD}         ${True}         ${True}     ${True}             ${True}                 ${True}


*** Keywords ***
Verify System Access by Specific User
    [Documentation]    Verify that a specific authorized user can access the system successfully
    [Tags]    access    positive
    [Arguments]    ${username}
    ...    ${password}
    ...    ${access_form}
    ...    ${rm_view}
    ...    ${supervision_view}
    ...    ${dynamic_dashboard}
    ...    ${reportings}
    Given I submit login form with username "${username}" and password "${password}"
    Then I am on the dashboard page
    ...    ${access_form}
    ...    ${rm_view}
    ...    ${supervision_view}
    ...    ${dynamic_dashboard}
    ...    ${reportings}
