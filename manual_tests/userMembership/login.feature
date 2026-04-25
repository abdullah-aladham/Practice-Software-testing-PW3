Feature: Login
  As a registered user
  I want to authenticate using the login page
  So that I can access my account securely

  Scenario: Successful login with valid username and password
    Given the user is on the login page
    And the user enters a valid username
    And the user enters a valid password
    When the user clicks the login button
    Then the user should be redirected to the dashboard
    And a welcome message should be displayed

  Scenario: Login fails with invalid password
    Given the user is on the login page
    And the user enters a valid username
    And the user enters an invalid password
    When the user clicks the login button
    Then an error message "Invalid username or password" should be shown
    And the user should remain on the login page

  Scenario: Login fails with invalid username
    Given the user is on the login page
    And the user enters an invalid username
    And the user enters a valid password
    When the user clicks the login button
    Then an error message "Invalid username or password" should be shown
    And the user should remain on the login page

  Scenario: Login fails with both username and password empty
    Given the user is on the login page
    And the user leaves the username field blank
    And the user leaves the password field blank
    When the user clicks the login button
    Then validation messages should appear for both username and password
    And the user should remain on the login page

  Scenario: Login fails with empty username
    Given the user is on the login page
    And the user leaves the username field blank
    And the user enters a valid password
    When the user clicks the login button
    Then a validation message "Username is required" should be displayed
    And the user should remain on the login page

  Scenario: Login fails with empty password
    Given the user is on the login page
    And the user enters a valid username
    And the user leaves the password field blank
    When the user clicks the login button
    Then a validation message "Password is required" should be displayed
    And the user should remain on the login page

  Scenario: Login fails with username containing invalid characters
    Given the user is on the login page
    And the user enters a username with invalid characters
    And the user enters a valid password
    When the user clicks the login button
    Then an error message "Invalid username format" should be shown
    And the user should remain on the login page

  Scenario: Login fails when account is locked
    Given the user is on the login page
    And the user enters a locked account username
    And the user enters the correct password
    When the user clicks the login button
    Then an error message "Your account is locked" should be shown
    And the user should remain on the login page

  Scenario: User can recover from failed login and log in successfully
    Given the user is on the login page
    And the user enters a valid username
    And the user enters an invalid password
    When the user clicks the login button
    Then an error message should be displayed
    When the user corrects the password to the valid value
    And the user clicks the login button again
    Then the user should be redirected to the dashboard

  Scenario: Login form preserves username after failed submission
    Given the user is on the login page
    And the user enters a valid username
    And the user enters an invalid password
    When the user clicks the login button
    Then the username field should still contain the entered username
    And the password field should be cleared or masked
