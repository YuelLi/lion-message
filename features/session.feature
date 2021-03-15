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
  Then I should be on the posts page
  And I should see "Yuankai"
  And I should not see "Minhe"

# Scenario: logged in with session
#   Given I am logged in as "Minhe"
#   Then I should be on the posts page
#   And I should see "Minhe"

Scenario: sign out
  Given I am on the home page
  And I press "Login"
  Then I should be on the login page
  When I fill in "username" with "Yuankai"
  And I fill in "password" with "yuankai1234"
  And I press "Login"
  Then I should be on the posts page
  And I should see "Yuankai"
  And I go to logout
  Then I should be on the login page