*** Settings ***
Documentation       Resource file for HVC 360 View related keywords


*** Keywords ***
I am on the HVC 360 View page of customer "${customer_name}"
    [Documentation]    Verify that the user is on the HVC 360 View page
    Fail    Not implemented yet

I see customer profile client details for customer "${customer_name}"
    [Documentation]    Verify that the customer profile client details are displayed for the given customer
    [Arguments]    ${gender}
    ...    ${msisdn}
    ...    ${first_name}
    ...    ${seniority_on_network_max}
    ...    ${profession}
    ...    ${npi}
    ...    ${type_of_hvc}
    ...    ${global_arpu_all_msisdn}
    ...    ${rm_name}
    ...    ${age}
    Fail    Not implemented yet
