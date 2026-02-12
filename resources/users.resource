*** Settings ***
Documentation       Resource file for user related keywords

Library             Collections
Resource            ./dashboard.resource


*** Variables ***
${SUPER_ADMIN_USERNAME}                                                     superadmin@mtn.com
${SUPER_ADMIN_PASSWORD}                                                     SuperSecretPassword123!
${ADMIN_WILL_BE_BLOCKED_USERNAME}                                           admin_blocked@mtn.com
${ADMIN_WILL_BE_BLOCKED_PASSWORD}                                           AdminPassword123!
${USER_FROM_HVC_RM_TEAM_USERNAME}                                           hvc_rm_user@mtn.com
${USER_FROM_HVC_RM_TEAM_PASSWORD}                                           HvcRmUserPassword123!
${USER_FROM_EXCO_TEAM_USERNAME}                                             exco_user@mtn.com
${USER_FROM_EXCO_TEAM_PASSWORD}                                             ExcoUserPassword123!
${USER_FROM_HVC_RM_TEAM_WITH_NO_ACCESS_TO_RM_VIEW_USERNAME}                 hvc_no_rm_view_user@mtn.com
${USER_FROM_HVC_RM_TEAM_WITH_NO_ACCESS_TO_RM_VIEW_PASSWORD}                 HvcNoRmViewPassword123!
${USER_FROM_HVC_RM_TEAM_WITH_NO_ACCESS_TO_SUPERVISION_VIEW_USERNAME}        hvc_no_supervision_view_user@mtn.com
${USER_FROM_HVC_RM_TEAM_WITH_NO_ACCESS_TO_SUPERVISION_VIEW_PASSWORD}        HvcNoSupervisionViewPassword123!
${USER_FROM_HVC_RM_TEAM_WITH_NO_ACCESS_TO_DYNAMIC_DASHBOARD_USERNAME}       hvc_no_dynamic_dashboard_user@mtn.com
${USER_FROM_HVC_RM_TEAM_WITH_NO_ACCESS_TO_DYNAMIC_DASHBOARD_PASSWORD}       HvcNoDynamicDashboardPassword123!
${USER_FROM_HVC_RM_TEAM_WITH_NO_ACCESS_TO_REPORTINGS_USERNAME}              hvc_no_reportings_user@mtn.com
${USER_FROM_HVC_RM_TEAM_WITH_NO_ACCESS_TO_REPORTINGS_PASSWORD}              HvcNoReportingsPassword123!
${EXCO_USER_WITH_NO_ACCESS_TO_RM_VIEW_USERNAME}                             exco_no_rm_view_user@mtn.com
${EXCO_USER_WITH_NO_ACCESS_TO_RM_VIEW_PASSWORD}                             ExcoNoRmViewPassword123!
${EXCO_USER_WITH_NO_ACCESS_TO_SUPERVISION_VIEW_USERNAME}                    exco_no_supervision_view_user@mtn.com
${EXCO_USER_WITH_NO_ACCESS_TO_SUPERVISION_VIEW_PASSWORD}                    ExcoNoSupervisionViewPassword123!
${EXCO_USER_WITH_NO_ACCESS_TO_DYNAMIC_DASHBOARD_USERNAME}                   exco_no_dynamic_dashboard_user@mtn.com
${EXCO_USER_WITH_NO_ACCESS_TO_DYNAMIC_DASHBOARD_PASSWORD}                   ExcoNoDynamicDashboardPassword123!
${EXCO_USER_WITH_NO_ACCESS_TO_REPORTINGS_USERNAME}                          exco_no_reportings_user@mtn.com
${EXCO_USER_WITH_NO_ACCESS_TO_REPORTINGS_PASSWORD}                          ExcoNoReportingsPassword123!
${EXCO_USER_WITH_NO_ACCESS_TO_SHOW_ALL_CUSTOMERS_USERNAME}                  exco_no_show_all_customers@mtn.com
${EXCO_USER_WITH_NO_ACCESS_TO_SHOW_ALL_CUSTOMERS_PASSWORD}                  ExcoNoShowAllCustomersPassword123!
${GM_USER_USERNAME}                                                         gm_user@mtn.com
${GM_USER_PASSWORD}                                                         GmUserPassword123!
${GM_USER_WITH_NO_ACCESS_TO_SHOW_ALL_CUSTOMERS_USERNAME}                    gm_no_show_all_customers@mtn.com
${GM_USER_WITH_NO_ACCESS_TO_SHOW_ALL_CUSTOMERS_PASSWORD}                    GmNoShowAllCustomersPassword123!
${SUPERVISION_USER_USERNAME}                                                supervision_user@mtn.com
${SUPERVISION_USER_PASSWORD}                                                SupervisionUserPassword123!
${SUPERVISION_USER_WITH_NO_ACCESS_TO_SHOW_ALL_CUSTOMERS_USERNAME}           supervision_no_show_all_customers@mtn.com
${SUPERVISION_USER_WITH_NO_ACCESS_TO_SHOW_ALL_CUSTOMERS_PASSWORD}           SupervisionNoShowAllCustomersPassword123!


*** Keywords ***
I see user search input
    [Documentation]    Verify that the user search input is visible on the Users management page
    Fail    Not implemented yet

I enter "${search_query}" in user search input
    [Documentation]    Enter the given search query into the user search input on the Users management page
    Fail    Not implemented yet

I see users table
    [Documentation]    Verify that the users table is displayed on the Users management page
    Fail    Not implemented yet

I am on the Users page
    [Documentation]    Verify that the user is on the Users management page
    I see users table
    Fail    Not implemented yet

I retrieve user list
    [Documentation]    Retrieve the list of users from the Users management page
    Fail    Not implemented yet
    RETURN    @{EMPTY}

I see the specified user in the user list
    [Documentation]    Verify that the specified user is present in the retrieved user list
    [Arguments]    ${username}
    ${users} =    I retrieve user list
    FOR    ${user}    IN    @{users}
        ${username_from_list} =    Get From Dictionary    ${user}    username
        IF    '${username_from_list}' == '${username}'    BREAK
    END
    Fail    User '${username}' not found in the user list

I click on user with username "${username}"
    [Documentation]    Click on the user with the specified username in the Users management page
    Fail    Not implemented yet

I am on the user details page for user "${username}"
    [Documentation]    Verify that the user is on the user details page for the specified username
    Fail    Not implemented yet

I see customer wallet section
    [Documentation]    Verify that the customer wallet section is visible on the user details page
    Fail    Not implemented yet

I see add MSISDN button
    [Documentation]    Verify that the "Add MSISDN" button is visible on the user details page
    Fail    Not implemented yet

I click add MSISDN button
    [Documentation]    Click the "Add MSISDN" button on the user details page
    Fail    Not implemented yet

I see MSISDN table
    [Documentation]    Verify that the MSISDN table is displayed on the user details page
    Fail    Not implemented yet

I retrieve MSISDN list from customer wallet section
    [Documentation]    Retrieve the list of MSISDNs from the customer wallet section on the user details page
    Fail    Not implemented yet
    RETURN    @{EMPTY}

I see the specified MSISDN in the MSISDN list
    [Documentation]    Verify that the specified MSISDN is present in the retrieved MSISDN list from the customer wallet section
    [Arguments]    ${msisdn}
    ${msisdns} =    I retrieve MSISDN list from customer wallet section
    FOR    ${msisdn_entry}    IN    @{msisdns}
        ${msisdn_from_list} =    Get From Dictionary    ${msisdn_entry}    msisdn
        IF    '${msisdn_from_list}' == '${msisdn}'    BREAK
    END
    Fail    MSISDN '${msisdn}' not found in the customer wallet section

I see add MSISDN form
    [Documentation]    Verify that the "Add MSISDN" form is displayed on the user details page
    Fail    Not implemented yet

I enter MSISDN "${msisdn}" in add MSISDN form
    [Documentation]    Enter the specified MSISDN into the "Add MSISDN" form on the user details page
    Fail    Not implemented yet

I submit add MSISDN form
    [Documentation]    Submit the "Add MSISDN" form on the user details page
    Fail    Not implemented yet

I cancel add MSISDN form
    [Documentation]    Cancel the "Add MSISDN" form on the user details page
    Fail    Not implemented yet

I see MSISDN "${msisdn}" in customer wallet section
    [Documentation]    Verify that the specified MSISDN is present in the customer wallet section on the user details page
    Fail    Not implemented yet

I add MSISDN "${msisdn}" to user "${username}"
    [Documentation]    Add the specified MSISDN to the user with the given username
    I am on the Users page
    I enter "${username}" in user search input
    I see the specified user in the user list    ${username}
    I click on user with username "${username}"
    I am on the user details page for user "${username}"
    I see customer wallet section
    I see add MSISDN button
    I click add MSISDN button
    I see add MSISDN form
    I enter MSISDN "${msisdn}" in add MSISDN form
    I submit add MSISDN form
    I see MSISDN "${msisdn}" in customer wallet section

I add "${msisdns}" to user "${username}"
    [Documentation]    Add multiple MSISDNs to the user with the given username
    [Arguments]    ${avoid_adding_existing_msisdns}=${False}
    FOR    ${msisdn}    IN    @{msisdns}
        IF    ${avoid_adding_existing_msisdns}
            TRY
                I add MSISDN "${msisdn}" to user "${username}"
            EXCEPT
                I cancel add MSISDN form
            END
        ELSE
            I add MSISDN "${msisdn}" to user "${username}"
        END
    END

I go to users page and add "${msisdns}" to user "${username}"
    [Documentation]    Navigate to the Users management page and add multiple MSISDNs to the user with the given username
    [Arguments]    ${avoid_adding_existing_msisdns}=${False}
    I click user menu
    I am on the Users page
    I add "${msisdns}" to user "${username}"    ${avoid_adding_existing_msisdns}
