Feature: user sign up, user profile

  As a visitor, I can sign up an account.
  Also, I can see username.

Background: having users in database

  Given the following users exist:
  | username | password | email             | role    | department
  | Minhe    | minhe1234| mh@columbia.edu   | student | Computer Science
  | Yu       | yuli1234 | yl@columbia.edu   | student | Computer Scinece 

  Given the following departments exist:
  | name                    |
  | Computer Science        |
  | Electrical Engineering  |
  | Columbia Finance        |
  | ISSO                    |

Scenario: sign up an account
  Given I am on the home page
  And I follow "Register"
  Then I should be on the sign up page
  When I fill in "username" with "Yuankai"
  And I fill in "password" with "yuankai1234"
  And I fill in "email" with "yk@columbia.edu"
  And I press "submit"
  Then I should be on the posts page
  And I should see "Yuankai"
  And I should not see "Minhe"

Scenario: login and click user page 
  Given I am on the home page
  And I press "Login"
  Then I should be on the login page
  When I fill in "username" with "Yu"
  And I fill in "password" with "yuli1234"
  And I press "Login"
  Then I should be on the posts page
  And I should see "Yu"
  And I go to user
  And I should see "Yu"
  And I fill in "email" with "yl4736@columbia.edu"
  And I select "department" with "Electrical Engineering"
  And I press "Save"
  And I should see "Successfully updated"