*** Settings ***
Documentation       Test suite to verify that EXCO / GM / Supervision have access to all wallets if they have the necessary authorization

Resource            ../resources/login.resource
Resource            ../resources/users.resource

Test Setup          I open browser and go to login page
Test Teardown       I close browser
Test Template       Verify EXCO / GM / Supervision Access to All Wallets with Authorization


*** Variables ***
${MSISDN_OUTSIDE_WALLET}    1234567890


*** Test Cases ***                                          username                                                                password                                                                should_have_access
Verify EXCO User Access to All Wallets                      ${USER_FROM_EXCO_TEAM_USERNAME}                                         ${USER_FROM_EXCO_TEAM_PASSWORD}                                         ${True}
Verify GM User Access to All Wallets                        ${GM_USER_USERNAME}                                                     ${GM_USER_PASSWORD}                                                     ${True}
Verify Supervision User Access to All Wallets               ${SUPERVISION_USER_USERNAME}                                            ${SUPERVISION_USER_PASSWORD}                                            ${True}
Verify EXCO User Without Access to All Wallets              ${EXCO_USER_WITH_NO_ACCESS_TO_SHOW_ALL_CUSTOMERS_USERNAME}              ${EXCO_USER_WITH_NO_ACCESS_TO_SHOW_ALL_CUSTOMERS_PASSWORD}              ${False}
Verify GM User Without Access to All Wallets                ${GM_USER_WITH_NO_ACCESS_TO_SHOW_ALL_CUSTOMERS_USERNAME}                ${GM_USER_WITH_NO_ACCESS_TO_SHOW_ALL_CUSTOMERS_PASSWORD}                ${False}
Verify Supervision User Without Access to All Wallets       ${SUPERVISION_USER_WITH_NO_ACCESS_TO_SHOW_ALL_CUSTOMERS_USERNAME}       ${SUPERVISION_USER_WITH_NO_ACCESS_TO_SHOW_ALL_CUSTOMERS_PASSWORD}       ${False}


*** Keywords ***
Verify EXCO / GM / Supervision Access to All Wallets with Authorization
    [Documentation]    Verify that EXCO / GM / Supervision users have access to all wallets if they have the necessary authorization
    [Arguments]    ${username}    ${password}    ${should_have_access}
    Given I submit login form with username "${username}" and password "${password}"
    And I am on the dashboard page
    When I enter "${MSISDN_OUTSIDE_WALLET}" in customer search field on access form
    IF    ${should_have_access}
        Then I see the specified customer in customer table on access form    msisdn=${MSISDN_OUTSIDE_WALLET}
    ELSE
        Then I don't see the specified customer in customer table on access form    msisdn=${MSISDN_OUTSIDE_WALLET}
    END
# Question : Les droits d'accès sont-ils gérés sur la plateforme ou via un système externe ?
