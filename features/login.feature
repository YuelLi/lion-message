Feature: user login

  As a student, I can login to lion-message.
  Also, I can see username.

Background: having users in database

  Given the following users exist:
  | username | password | role    |
  | Minhe    | minhe1234       | student |
  | Yuankai  | yuankai1234     | student |

Scenario: login with valid credentials
  Given I am on the home page
  And I press "Login"
  Then I should be on the login page
  When I fill in "username" with "Yuankai"
  And I fill in "password" with "yuankai1234"
  And I press "Login"
  Then I should be on the welcome page
  And I should see "Logged In, student Yuankai"
  And I should not see "Minhe"