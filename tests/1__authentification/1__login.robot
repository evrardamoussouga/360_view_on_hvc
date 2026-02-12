*** Settings ***
Documentation       Test suite for login functionality

Resource            ../resources/login.resource
Resource            ../resources/users.resource

Test Teardown       I close browser


*** Test Cases ***
Valid Login
    [Documentation]    Test login with valid credentials
    [Tags]    login    positive
    Given I open browser and go to login page
    When I submit login form with username "${SUPER_ADMIN_USERNAME}" and password "${SUPER_ADMIN_PASSWORD}"
    Then I am on the dashboard page

# Review : Fréquence journalière des connexions (logs) obligatoire.
# Question : L'interface de visualisation des logs de connexion doit-elle être intégrée à la plateforme ou gérée séparément ?
