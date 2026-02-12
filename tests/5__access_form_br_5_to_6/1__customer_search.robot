*** Settings ***
Documentation       Test suite to verify search field functionality in access form

Resource            ../resources/login.resource
Resource            ../resources/users.resource

Test Setup          I open browser and go to login page
Test Teardown       I close browser
Test Template       Ensure that customer search results correspond to the search criteria


*** Test Cases ***                                          search_query    min_expected_results    npi_filter      min_expected_npi_results
Search by Customer Name                                     Doe             1                       ${None}         ${None}
Search by Partial Customer Name                             oe              2                       ${None}         ${None}
Search by Customer First Name                               John            1                       ${None}         ${None}
Search by Partial Customer First Name                       Jo              2                       ${None}         ${None}
Search by Msisdn                                            1234567890      1                       ${None}         ${None}
Search by Partial Msisdn                                    12345           3                       ${None}         ${None}
Search by Npi                                               9876543210      1                       ${None}         ${None}
Search by Partial Npi                                       98765           2                       ${None}         ${None}
Search by Type of HVC (Corporate)                           Corporate       4                       ${None}         ${None}
Search by Type of HVC (Individual)                          Individual      3                       ${None}         ${None}
Search by Partial Type of HVC                               Corp            15                      ${None}         ${None}
Search by RM name                                           Smith           2                       ${None}         ${None}
Search by Partial RM name                                   Smi             2                       ${None}         ${None}
Search by Profile (Prepaid/Postpaid)                        Prepaid         5                       ${None}         ${None}
Search by Partial Profile                                   Post            4                       ${None}         ${None}
Search by Non-Existent Name                                 Non-Existant    0                       ${None}         ${None}
Search by Partial Customer Name And Then Filter By NPI      oe              2                       12345           1


*** Keywords ***
Ensure that customer search results correspond to the search criteria
    [Documentation]    Verify that the search results in the access form correspond to the search criteria entered by the user
    [Tags]    search    positive
    [Arguments]    ${search_query}    ${min_expected_results}    ${npi_filter}    ${min_expected_npi_results}
    Given I login with username "${USER_FROM_HVC_RM_TEAM_USERNAME}" and password "${USER_FROM_HVC_RM_TEAM_PASSWORD}"
    When I enter "${search_query}" in customer search field on access form
    Then I make sure that the search results are correct up to the page "10", if necessary
    ...    ${search_query}
    ...    ${min_expected_results}
    IF    '${npi_filter}' != '${None}'
        When I click the pagination button "1"
        And I enter npi filter "npi filter" in npi column filter on access form
        Then I make sure that the npi filtered results are correct up to the page "10", if necessary
        ...    ${npi_filter}
        ...    ${min_expected_npi_results}
    END

# Review : Les colonnes affichées sont non modifiables par l’utilisateur
# Review : Le téléchargement des informations n’est pas disponible

# Question : Sur la table de résultats du formulaire d'accès (ou access form), sur quelle colonne le tri doit-il être effectué par défaut ?
