Feature: user sign up

  As a visitor, I can sign up an account.
  Also, I can see username.

Background: having users in database

  Given the following users exist:
  | username | password | role    |
  | Minhe    | minhe1234       | student |
  | Yuankai  | yuankai1234     | student |

Scenario: sign up an account
  Given I am on the home page
  And I follow "Register"
  Then I should be on the sign up page
  When I fill in "username" with "Yuankai"
  And I fill in "password" with "yuankai1234"
  And I press "submit"
  Then I should be on the posts page
  And I should see "Yuankai"
  And I should not see "Minhe"
