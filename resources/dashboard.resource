*** Settings ***
Documentation       Resource file for dashboard related keywords

Library             Collections
Resource            ./common.resource


*** Keywords ***
I am on the dashboard page
    [Documentation]    Verify that the user is on the dashboard page
    [Arguments]    ${access_form}=${True}
    ...    ${rm_view}=${True}
    ...    ${supervision_view}=${True}
    ...    ${dynamic_dashboard}=${True}
    ...    ${reportings}=${True}
    ...    ${user_menu}=${True}
    IF    ${access_form}
        I see access form on dashboard
    ELSE
        I don't see access form on dashboard
    END
    IF    ${rm_view}
        I see RM View element
    ELSE
        I don't see RM View element
    END
    IF    ${supervision_view}
        I see Supervision View element
    ELSE
        I don't see Supervision View element
    END
    IF    ${dynamic_dashboard}
        I see Dynamic Dashboard element
    ELSE
        I don't see Dynamic Dashboard element
    END
    IF    ${reportings}
        I see Reportings element
    ELSE
        I don't see Reportings element
    END
    IF    ${user_menu}    I see user menu    ELSE    I don't see user menu
    Fail    Not implemented yet

I logout from dashboard
    [Documentation]    Log out the user from the dashboard
    Fail    Not implemented yet

I see customer search field on access form
    [Documentation]    Verify that the customer search field is present on the access form
    Fail    Not implemented yet

I wait customer search results to load on access form
    [Documentation]    Wait for the customer search results to load on the access form
    Fail    Not implemented yet

I enter "${search_query}" in customer search field on access form
    [Documentation]    Enter the specified search query in the customer search field on the access form
    Sleep    2s
    Fail    Not implemented yet
    I wait customer search results to load on access form

I enter npi filter "${npi_filter}" in npi column filter on access form
    [Documentation]    Enter the specified npi filter in the npi column filter on the access form
    Sleep    2s
    Fail    Not implemented yet
    I wait customer search results to load on access form

I see "${column_name}" column in customer table on access form
    [Documentation]    Verify that the specified column is present in the customer table on the access form
    Fail    Not implemented yet

I see customer table on access form
    [Documentation]    Verify that the customer table is present on the access form
    I see "name" column in customer table on access form
    I see "first name" column in customer table on access form
    I see "msisdn" column in customer table on access form
    I see "npi" column in customer table on access form
    I see "type of HVC" column in customer table on access form
    I see "RM name" column in customer table on access form
    I see "profile (pre/post)" column in customer table on access form

I see access form on dashboard
    [Documentation]    Verify that the access form is present on the dashboard
    I see customer search field on access form
    I see customer table on access form

I don't see access form on dashboard
    [Documentation]    Verify that the access form is not present on the dashboard
    Fail    Not implemented yet

I retrieve customer search results from customer table on access form
    [Documentation]    Retrieve the customer results from the customer table on the access form
    Fail    Not implemented yet
    RETURN    @{EMPTY}

I note that the number of "${customers}" in customer table is at least "${min_count}"
    [Documentation]    Verify that the number of customers in the customer table is at least the specified minimum count
    ${customers_count} =    Get Length    ${customers}
    Should Be True
    ...    ${customers_count} >= ${min_count}
    ...    msg=Expected at least ${min_count} results, but got ${customers_count}.

I note that the number of "${customers}" in customer table is at most "${max_count}"
    [Documentation]    Verify that the number of customers in the customer table is at most the specified maximum count
    ${customers_count} =    Get Length    ${customers}
    Should Be True
    ...    ${customers_count} <= ${max_count}
    ...    msg=Expected at most ${max_count} results, but got ${customers_count}.

I note that the value of npi column in each of the "${customers}" matches the npi filter "${npi_filter}"
    [Documentation]    Verify that the npi value in each of the customers matches the specified npi filter
    FOR    ${customer}    IN    @{customers}
        Log    Verifying customer: ${customer}
        ${npi} =    Get From Dictionary    ${customer}    npi
        Should Contain    ${npi}    ${npi_filter}
    END

I note that at least one column in each of the "${customers}" matches the search criteria "${search_query}"
    [Documentation]    Verify that all customers in the customer table match the specified search criteria
    ${search_query_lower} =    Evaluate    "${search_query}".lower()
    FOR    ${customer}    IN    @{customers}
        Log    Verifying customer: ${customer}
        ${name} =    Get From Dictionary    ${customer}    name
        ${name} =    Evaluate    "${name}".lower()
        ${first_name} =    Get From Dictionary    ${customer}    first_name
        ${first_name} =    Evaluate    "${first_name}".lower()
        ${msisdn} =    Get From Dictionary    ${customer}    msisdn
        ${msisdn} =    Evaluate    "${msisdn}".lower()
        ${npi} =    Get From Dictionary    ${customer}    npi
        ${npi} =    Evaluate    "${npi}".lower()
        ${type_of_hvc} =    Get From Dictionary    ${customer}    type_of_hvc
        ${type_of_hvc} =    Evaluate    "${type_of_hvc}".lower()
        ${rm_name} =    Get From Dictionary    ${customer}    rm_name
        ${rm_name} =    Evaluate    "${rm_name}".lower()
        ${profile} =    Get From Dictionary    ${customer}    profile
        ${profile} =    Evaluate    "${profile}".lower()
        ${name_contains_query} =    Run Keyword And Return Status
        ...    Should Contain    ${name}    ${search_query_lower}
        ${first_name_contains_query} =    Run Keyword And Return Status
        ...    Should Contain    ${first_name}    ${search_query_lower}
        ${msisdn_contains_query} =    Run Keyword And Return Status
        ...    Should Contain    ${msisdn}    ${search_query_lower}
        ${npi_contains_query} =    Run Keyword And Return Status
        ...    Should Contain    ${npi}    ${search_query_lower}
        ${type_of_hvc_contains_query} =    Run Keyword And Return Status
        ...    Should Contain    ${type_of_hvc}    ${search_query_lower}
        ${rm_name_contains_query} =    Run Keyword And Return Status
        ...    Should Contain    ${rm_name}    ${search_query_lower}
        ${profile_contains_query} =    Run Keyword And Return Status
        ...    Should Contain    ${profile}    ${search_query_lower}
        Then Should Be True
        ...    ${name_contains_query} or ${first_name_contains_query} or ${msisdn_contains_query} or ${npi_contains_query} or ${type_of_hvc_contains_query} or ${rm_name_contains_query} or ${profile_contains_query}
        ...    msg=Customer ${customer} does not match the search query "${search_query}"
    END

I make sure that the search results are correct up to the page "${page_number}", if necessary
    [Documentation]    Ensure that the search results are correct until the specified page number
    [Arguments]    ${search_query}
    ...    ${min_expected_results}
    ...    ${current_page}=1
    ...    ${max_results_per_page}=10
    IF    ${current_page} > ${page_number}    RETURN
    I see the pagination button "${current_page}"
    I click the pagination button "${current_page}"
    ${customers} =    I retrieve customer search results from customer table on access form
    IF    ${min_expected_results} > ${max_results_per_page}
        ${remaining_expected_results} =    Evaluate    ${min_expected_results} - ${max_results_per_page}
    ELSE
        VAR    ${remaining_expected_results} =    ${min_expected_results}
        ${remaining_expected_results} =    Convert To Integer    ${remaining_expected_results}
    END
    ${min_results_expected_in_current_page} =    Evaluate
    ...    min(${remaining_expected_results}, ${max_results_per_page})
    I note that the number of "${customers}" in customer table is at least "${min_results_expected_in_current_page}"
    I note that the number of "${customers}" in customer table is at most "${max_results_per_page}"
    I note that at least one column in each of the "${customers}" matches the search criteria "${search_query}"
    ${next_page} =    Evaluate    ${current_page} + 1
    IF    ${remaining_expected_results} > 10
        I make sure that the search results are correct up to the page "${page_number}", if necessary
        ...    ${search_query}
        ...    ${remaining_expected_results}
        ...    ${next_page}
    ELSE
        I don't see the pagination button "${next_page}"
    END

I make sure that the npi filtered results are correct up to the page "${page_number}", if necessary
    [Documentation]    Ensure that the npi filtered results are correct until the specified page number
    [Arguments]    ${npi_filter}
    ...    ${min_expected_npi_results}
    ...    ${current_page}=1
    ...    ${max_results_per_page}=10
    IF    ${current_page} > ${page_number}    RETURN
    I see the pagination button "${current_page}"
    I click the pagination button "${current_page}"
    ${customers} =    I retrieve customer search results from customer table on access form
    IF    ${min_expected_npi_results} > ${max_results_per_page}
        ${remaining_expected_npi_results} =    Evaluate    ${min_expected_npi_results} - ${max_results_per_page}
    ELSE
        VAR    ${remaining_expected_npi_results} =    ${min_expected_npi_results}
        ${remaining_expected_npi_results} =    Convert To Integer    ${remaining_expected_npi_results}
    END
    ${min_npi_results_expected_in_current_page} =    Evaluate
    ...    min(${remaining_expected_npi_results}, ${max_results_per_page})
    I note that the number of "${customers}" in customer table is at least "${min_npi_results_expected_in_current_page}"
    I note that the number of "${customers}" in customer table is at most "${max_results_per_page}"
    I note that the value of npi column in each of the "${customers}" matches the npi filter "${npi_filter}"
    ${next_page} =    Evaluate    ${current_page} + 1
    IF    ${remaining_expected_npi_results} > 10
        I make sure that the npi filtered results are correct up to the page "${page_number}", if necessary
        ...    ${npi_filter}
        ...    ${remaining_expected_npi_results}
        ...    ${next_page}
    ELSE
        I don't see the pagination button "${next_page}"
    END

I see the specified customer in customer table on access form
    [Documentation]    Verify that the specified customer is present in the customer table on the access form
    [Arguments]    ${name}=${None}
    ...    ${first_name}=${None}
    ...    ${msisdn}=${None}
    ...    ${npi}=${None}
    ...    ${type_of_hvc}=${None}
    ...    ${rm_name}=${None}
    ...    ${profile}=${None}
    Fail    Not implemented yet

I don't see the specified customer in customer table on access form
    [Documentation]    Verify that the specified customer is not present in the customer table on the access form
    [Arguments]    ${name}=${None}
    ...    ${first_name}=${None}
    ...    ${msisdn}=${None}
    ...    ${npi}=${None}
    ...    ${type_of_hvc}=${None}
    ...    ${rm_name}=${None}
    ...    ${profile}=${None}
    ${see} =    Run Keyword And Return Status
    ...    I see the specified customer in customer table on access form    ${name}
    ...        ${first_name}
    ...        ${msisdn}
    ...        ${npi}
    ...        ${type_of_hvc}
    ...        ${rm_name}
    ...        ${profile}
    Should Not Be True    ${see}    msg=Customer should not be present in the customer table on access form

I click the specified customer in customer table on access form
    [Documentation]    Click on the specified customer in the customer table on the access form
    [Arguments]    ${name}=${None}
    ...    ${first_name}=${None}
    ...    ${msisdn}=${None}
    ...    ${npi}=${None}
    ...    ${type_of_hvc}=${None}
    ...    ${rm_name}=${None}
    ...    ${profile}=${None}
    Fail    Not implemented yet

I see RM View element
    [Documentation]    Verify that the RM View element is present on the dashboard
    Fail    Not implemented yet

I don't see RM View element
    [Documentation]    Verify that the RM View element is not present on the dashboard
    Fail    Not implemented yet

I click RM View
    [Documentation]    Click on the RM View element on the dashboard
    Fail    Not implemented yet

I see Supervision View element
    [Documentation]    Verify that the Supervision View element is present on the dashboard
    Fail    Not implemented yet

I don't see Supervision View element
    [Documentation]    Verify that the Supervision View element is not present on the dashboard
    Fail    Not implemented yet

I click Supervision View
    [Documentation]    Click on the Supervision View element on the dashboard
    Fail    Not implemented yet

I see Dynamic Dashboard element
    [Documentation]    Verify that the Dynamic Dashboard element is present on the dashboard
    Fail    Not implemented yet

I don't see Dynamic Dashboard element
    [Documentation]    Verify that the Dynamic Dashboard element is not present on the dashboard
    Fail    Not implemented yet

I click Dynamic Dashboard
    [Documentation]    Click on the Dynamic Dashboard element on the dashboard
    Fail    Not implemented yet

I see Reportings element
    [Documentation]    Verify that the Reportings element is present on the dashboard
    Fail    Not implemented yet

I don't see Reportings element
    [Documentation]    Verify that the Reportings element is not present on the dashboard
    Fail    Not implemented yet

I click Reportings
    [Documentation]    Click on the Reportings element on the dashboard
    Fail    Not implemented yet

I see user menu
    [Documentation]    Verify that the user menu is visible on the dashboard
    Fail    Not implemented yet

I don't see user menu
    [Documentation]    Verify that the user menu is not visible on the dashboard
    Fail    Not implemented yet

I click user menu
    [Documentation]    Click on the user menu on the dashboard
    Fail    Not implemented yet
