*** Settings ***
Documentation       Test suite for login functionality with error scenarios

Resource            ../resources/login.resource
Resource            ../resources/users.resource

Suite Setup         I open browser and go to login page
Suite Teardown      I close browser
Test Teardown       I clear login form fields
Test Template       Invalid Login


*** Test Cases ***                                                      username                        password                    error_message
Invalid Login with Empty Username                                       ${EMPTY}                        somepassword                Username cannot be empty.
Invalid Login with Empty Password                                       ${SUPER_ADMIN_USERNAME}         ${EMPTY}                    Password cannot be empty.
Invalid Login with inexistent User                                      nonexistentuser@mtn.com         ${SUPER_ADMIN_PASSWORD}     Invalid username or password.
Invalid Login with Wrong Password                                       ${SUPER_ADMIN_USERNAME}         WrongPassword123!           Invalid username or password.
Invalid Login with Both Wrong                                           bothwrong@mtn.com               WrongPassword123!           Invalid username or password.
Invalid Login with invalid Email Format Without At Symbol and Domain    invalidemailformat              ${SUPER_ADMIN_PASSWORD}     Invalid email format.
Invalid Login with invalid Email Format Missing Domain                  userwithoutdomain@              ${SUPER_ADMIN_PASSWORD}     Invalid email format.
Invalid Login with invalid Email Format Missing Username                @domain.com                     ${SUPER_ADMIN_PASSWORD}     Invalid email format.
Invalid Login with invalid Email Format Missing Top-Level Domain        user@domain                     ${SUPER_ADMIN_PASSWORD}     Invalid email format.
Invalid Login with invalid Email Format Missing Domain Name             user@.com                       ${SUPER_ADMIN_PASSWORD}     Invalid email format.
Invalid Login with invalid Email Format Missing At Symbol               userdomain.com                  ${SUPER_ADMIN_PASSWORD}     Invalid email format.
Invalid Login with invalid Email Format with Spaces                     user with spaces@domain.com     ${SUPER_ADMIN_PASSWORD}     Invalid email format.


*** Keywords ***
Invalid Login
    [Documentation]    Test login with invalid credentials
    [Tags]    login    negative
    [Arguments]    ${username}    ${password}    ${error_message}
    Given I submit login form with username "${username}" and password "${password}"
    Then I see an error message "${error_message}"
