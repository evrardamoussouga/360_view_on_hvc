*** Settings ***
Documentation       Test suite for login functionality with blocked user

Resource            ../resources/login.resource
Resource            ../resources/users.resource


*** Variables ***
${NUMBER_OF_LOGIN_ATTEMPTS}     5


*** Test Cases ***
Blocked User Login
    [Documentation]    Test login attempt with a blocked user
    [Tags]    login    negative    need_preparation
    VAR    ${current_attempt}=    1
    Given I open browser and go to login page
    WHILE    ${current_attempt} <= ${NUMBER_OF_LOGIN_ATTEMPTS}
        When I submit login form with username "${ADMIN_WILL_BE_BLOCKED_USERNAME}" and password "${ADMIN_WILL_BE_BLOCKED_PASSWORD}"
        Then I am on the dashboard page
        And I logout from dashboard
        And I am on login page
        FOR    ${index}    IN    ${current_attempt}
            Log    Attempt ${index} of ${current_attempt}
            When I submit login form with username "${ADMIN_WILL_BE_BLOCKED_USERNAME}" and password "WrongPassword123!"
            IF    ${index} != ${NUMBER_OF_LOGIN_ATTEMPTS}
                Then I see an error message "Invalid username or password."
            ELSE
                Then I see an error message "Your account has been blocked. Please contact support."
            END
        END
        IF    ${current_attempt} < ${NUMBER_OF_LOGIN_ATTEMPTS}
            When I submit login form with username "${ADMIN_WILL_BE_BLOCKED_USERNAME}" and password "${ADMIN_WILL_BE_BLOCKED_PASSWORD}"
            Then I am on the dashboard page
            And I logout from dashboard
            And I am on login page
        END
        ${current_attempt}=    Evaluate    ${current_attempt} + 1
    END
