*** Settings ***
Documentation       Test suite to verify view access by a specific authorized user

Resource            ../resources/login.resource
Resource            ../resources/users.resource
Resource            ../resources/rm_view.resource
Resource            ../resources/supervision_view.resource
Resource            ../resources/dynamic_dashboard.resource
Resource            ../resources/reportings.resource

Test Setup          I open browser and go to login page
Test Teardown       I close browser
Test Template       Verify View Access by Specific User


*** Test Cases ***                                          username                                                                    password                                                                    access_form     rm_view     supervision_view    dynamic_dashboard       reportings
Verify Access for HVC RM Team User                          ${USER_FROM_HVC_RM_TEAM_USERNAME}                                           ${USER_FROM_HVC_RM_TEAM_PASSWORD}                                           ${True}         ${True}     ${True}             ${True}                 ${True}
Verify Access for EXCO member                               ${USER_FROM_EXCO_TEAM_USERNAME}                                             ${USER_FROM_EXCO_TEAM_PASSWORD}                                             ${True}         ${True}     ${True}             ${True}                 ${True}
Verify HVC RM User with No Access to RM View                ${USER_FROM_HVC_RM_TEAM_WITH_NO_ACCESS_TO_RM_VIEW_USERNAME}                 ${USER_FROM_HVC_RM_TEAM_WITH_NO_ACCESS_TO_RM_VIEW_PASSWORD}                 ${True}         ${False}    ${True}             ${True}                 ${True}
Verify HVC RM User with No Access to Supervision View       ${USER_FROM_HVC_RM_TEAM_WITH_NO_ACCESS_TO_SUPERVISION_VIEW_USERNAME}        ${USER_FROM_HVC_RM_TEAM_WITH_NO_ACCESS_TO_SUPERVISION_VIEW_PASSWORD}        ${True}         ${True}     ${False}            ${True}                 ${True}
Verify HVC RM User with No Access to Dynamic Dashboard      ${USER_FROM_HVC_RM_TEAM_WITH_NO_ACCESS_TO_DYNAMIC_DASHBOARD_USERNAME}       ${USER_FROM_HVC_RM_TEAM_WITH_NO_ACCESS_TO_DYNAMIC_DASHBOARD_PASSWORD}       ${True}         ${True}     ${True}             ${False}                ${True}
Verify HVC RM User with No Access to Reportings             ${USER_FROM_HVC_RM_TEAM_WITH_NO_ACCESS_TO_REPORTINGS_USERNAME}              ${USER_FROM_HVC_RM_TEAM_WITH_NO_ACCESS_TO_REPORTINGS_PASSWORD}              ${True}         ${True}     ${True}             ${True}                 ${False}
Verify EXCO User with No Access to RM View                  ${EXCO_USER_WITH_NO_ACCESS_TO_RM_VIEW_USERNAME}                             ${EXCO_USER_WITH_NO_ACCESS_TO_RM_VIEW_PASSWORD}                             ${True}         ${False}    ${True}             ${True}                 ${True}
Verify EXCO User with No Access to Supervision View         ${EXCO_USER_WITH_NO_ACCESS_TO_SUPERVISION_VIEW_USERNAME}                    ${EXCO_USER_WITH_NO_ACCESS_TO_SUPERVISION_VIEW_PASSWORD}                    ${True}         ${True}     ${False}            ${True}                 ${True}
Verify EXCO User with No Access to Dynamic Dashboard        ${EXCO_USER_WITH_NO_ACCESS_TO_DYNAMIC_DASHBOARD_USERNAME}                   ${EXCO_USER_WITH_NO_ACCESS_TO_DYNAMIC_DASHBOARD_PASSWORD}                   ${True}         ${True}     ${True}             ${False}                ${True}
Verify EXCO User with No Access to Reportings               ${EXCO_USER_WITH_NO_ACCESS_TO_REPORTINGS_USERNAME}                          ${EXCO_USER_WITH_NO_ACCESS_TO_REPORTINGS_PASSWORD}                          ${True}         ${True}     ${True}             ${True}                 ${False}


*** Keywords ***
Verify View Access by Specific User
    [Documentation]    Verify that a specific authorized user can access the view successfully
    [Arguments]    ${username}
    ...    ${password}
    ...    ${access_form}
    ...    ${rm_view}
    ...    ${supervision_view}
    ...    ${dynamic_dashboard}
    ...    ${reportings}
    Given I submit login form with username "${username}" and password "${password}"
    And I am on the dashboard page
    ...    ${access_form}
    ...    ${rm_view}
    ...    ${supervision_view}
    ...    ${dynamic_dashboard}
    ...    ${reportings}
    IF    ${rm_view}
        When I click RM View
        Then I am on the RM View page
    END
    IF    ${supervision_view}
        When I click Supervision View
        Then I am on the Supervision View page
    END
    IF    ${dynamic_dashboard}
        When I click Dynamic Dashboard
        Then I am on the Dynamic Dashboard page
    END
    IF    ${reportings}
        When I click Reportings
        Then I am on the Reportings page
    END
