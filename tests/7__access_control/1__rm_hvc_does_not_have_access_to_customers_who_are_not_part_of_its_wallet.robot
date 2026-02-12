*** Settings ***
Documentation       Test suite to verify that RM HVC does not have access to customers who are not part of its wallet

Resource            ../resources/login.resource
Resource            ../resources/users.resource

Test Setup          I open browser and go to login page
Test Teardown       I close browser


*** Variables ***
${MSISDN_OUTSIDE_WALLET}    1234567890


*** Test Cases ***
Verify RM HVC Cannot Access Customers Outside Its Wallet
    [Documentation]    Verify that a RM HVC user cannot access customers who are not part of its wallet
    Given I submit login form with username "${USER_FROM_HVC_RM_TEAM_USERNAME}" and password "${USER_FROM_HVC_RM_TEAM_PASSWORD}"
    And I am on the dashboard page
    When I enter "${MSISDN_OUTSIDE_WALLET}" in customer search field on access form
    Then I don't see the specified customer in customer table on access form    msisdn=${MSISDN_OUTSIDE_WALLET}

# Question : L'ajout et le retrait d'un MSISDN au portefeuille d'un utilisateur doit-il être géré via l'interface ou par un système externe ?

