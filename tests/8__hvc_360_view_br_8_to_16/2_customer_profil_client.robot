*** Settings ***
Documentation       Test suite to verify that customer profile client details are correctly displayed in HVC 360 View

Resource            ../resources/login.resource
Resource            ../resources/users.resource
Resource            ../resources/hvc_360_view.resource

Test Setup          I open browser and go to login page
Test Teardown       I close browser


*** Variables ***
${CUSTOMER_NAME}                Doe
${GENDER}                       Male
${MSISDN}                       1234567890
${FIRST_NAME}                   John
${SENIORITY_ON_NETWORK_MAX}     5 years
${PROFESSION}                   Engineer
${NPI}                          123456
${TYPE_OF_HVC}                  Type A
${GLOBAL_ARPU_ALL_MSISDN}       50 USD
${RM_NAME}                      Jane Smith
${AGE}                          30
${PROFILE}                      Postpaid


*** Test Cases ***
Verify Customer Profile Client Details in HVC 360 View
    [Documentation]    Verify that the customer profile client details are correctly displayed in HVC 360 View
    Given I submit login form with username "${USER_FROM_HVC_RM_TEAM_USERNAME}" and password "${USER_FROM_HVC_RM_TEAM_PASSWORD}"
    And I am on the dashboard page
    When I enter "${CUSTOMER_NAME}" in customer search field on access form
    And I click the specified customer in customer table on access form
    ...    ${CUSTOMER_NAME}
    ...    ${FIRST_NAME}
    ...    ${MSISDN}
    ...    ${NPI}
    ...    ${TYPE_OF_HVC}
    ...    ${RM_NAME}
    ...    ${PROFILE}
    Then I am on the HVC 360 View page of customer "${CUSTOMER_NAME}"
    And I see customer profile client details for customer "${CUSTOMER_NAME}"
    ...    ${GENDER}
    ...    ${MSISDN}
    ...    ${FIRST_NAME}
    ...    ${SENIORITY_ON_NETWORK_MAX}
    ...    ${PROFESSION}
    ...    ${NPI}
    ...    ${TYPE_OF_HVC}
    ...    ${GLOBAL_ARPU_ALL_MSISDN}
    ...    ${RM_NAME}
    ...    ${AGE}
