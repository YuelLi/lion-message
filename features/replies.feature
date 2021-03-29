Feature: browse posts

  As a student, I can login to lion-message.
  Also, I can reply to a post.

Background: having user login and reply to a post

  Given the following users exist:
  | username | password        | role    |
  | Minhe    | minhe1234       | student |
  | Yuankai  | yuankai1234     | student |

  Given the following posts for reply exist:
  | topic    | subject        | body            | department  | user_id |
  | finance  | Too poor       | Too poor.       | CS          | 1       |
  | academic | Too many A+    | Too many A+.    | MATH        | 2       |

Scenario: login and reply to a posts
  Given I am on the home page
  And I press "Login"
  Then I should be on the login page
  When I fill in "username" with "Yuankai"
  And I fill in "password" with "yuankai1234"
  And I press "Login"
  Then I should be on the posts page
  And I press "Detail"
  And I press "Send Reply"
  And I fill in "Content" with "Hi, this is a testing reply message"
  And I press "Send"
  Then I should be on the replies page
  And I should see "Hi, this is a testing reply message"

Scenario: login and reply to a posts, and the edit the reply message
  Given I am on the home page
  And I press "Login"
  Then I should be on the login page
  When I fill in "username" with "Yuankai"
  And I fill in "password" with "yuankai1234"
  And I press "Login"
  Then I should be on the posts page
  And I press "Detail"
  And I press "Send Reply"
  And I fill in "Content" with "Hi, this is my original reply message"
  And I press "Send"
  Then I should be on the replies page
  And I should see "Hi, this is my original reply message"
  And I press "Edit"
  And I fill in "Content" with "Hi, this is a my edited reply message"
  And I press "Submit"
  Then I should be on the replies page
  And I should see "Hi, this is a my edited reply message"
