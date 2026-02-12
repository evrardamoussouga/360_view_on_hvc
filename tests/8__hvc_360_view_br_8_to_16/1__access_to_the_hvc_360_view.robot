*** Settings ***
Documentation       Test suite to verify that user can access the HVC 360 View page

Resource            ../resources/login.resource
Resource            ../resources/users.resource
Resource            ../resources/hvc_360_view.resource

Test Setup          I open browser and go to login page
Test Teardown       I close browser


*** Variables ***
${CUSTOMER_NAME}    Doe


*** Test Cases ***
Verify Access to the HVC 360 View Page
    [Documentation]    Verify that a user can access the HVC 360 View page successfully
    Given I submit login form with username "${USER_FROM_HVC_RM_TEAM_USERNAME}" and password "${USER_FROM_HVC_RM_TEAM_PASSWORD}"
    And I am on the dashboard page
    When I enter "${CUSTOMER_NAME}" in customer search field on access form
    And I click the specified customer in customer table on access form    name=${CUSTOMER_NAME}
    Then I am on the HVC 360 View page of customer "${CUSTOMER_NAME}"

# Review : Toutes les consultations sont retracées
# Question : Les logs des consultations sont-ils accessibles depuis l'interface ou uniquement via un système externe ?
