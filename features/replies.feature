Feature: browse posts

  As a student, I can login to lion-message.
  Also, I can reply to a post.

Background: having user login and reply to a post

  Given the following users exist:
  | username | password        | role    | department       |
  | Minhe    | minhe1234       | student | computer science |
  | Yuankai  | yuankai1234     | student | computer science |
  | Lisa     | lisa1234        | faculty | computer science |

  Given the following posts for reply exist:
  | topic    | subject        | body            | department        | user_id |
  | Finance  | Too poor       | Too poor.       | finance           | 1       | 
  | Course   | Too many A+    | Too many A+.    | computer science  | 2       |

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
  Then I should be on the replies page for post subject "Too many A+"
  And I should see "Hi, this is a testing reply message"

Scenario: login and reply to a posts, and edit the reply message
  Given I am on the home page
  And I press "Login"
  Then I should be on the login page
  When I fill in "username" with "Yuankai"
  And I fill in "password" with "yuankai1234"
  And I press "Login"
  Then I should be on the posts page
  When I go to the show page for subject "Too many A+"
  And I press "Send Reply"
  And I fill in "Content" with ""
  And I press "Send"
  Then I should be on the new reply page for post subject "Too many A+"
  And I should see "Content must be filled."
  And I fill in "Content" with "Hi, this is my original reply message"
  And I press "Send"
  Then I should be on the replies page for post subject "Too many A+"
  And I should see "Hi, this is my original reply message"
  And I press "Edit"
  And I fill in "Content" with ""
  And I press "Submit"
  Then I should see "Content must be filled."
  And I fill in "Content" with "Hi, this is a my edited reply message"
  And I press "Submit"
  Then I should be on the replies page for post subject "Too many A+"
  And I should see "Hi, this is a my edited reply message"

Scenario: faculty reply and edit
  Given I am on the home page
  And I press "Login"
  Then I should be on the login page
  When I fill in "username" with "Lisa"
  And I fill in "password" with "lisa1234"
  And I press "Login"
  Then I should be on the posts page
  And I should not see "Too poor."
  When I go to the show page for subject "Too many A+"
  And I press "Send Reply"
  And I fill in "Content" with ""
  And I press "Send"
  Then I should be on the new reply page for post subject "Too many A+"
  And I should see "Content must be filled."
  And I fill in "Content" with "This is Lisa, glad to offer you my help!"
  And I press "Send"
  Then I should be on the replies page for post subject "Too many A+"
  And I should see "This is Lisa, glad to offer you my help!"
  And I press "Edit"
  And I fill in "Content" with ""
  And I press "Submit"
  Then I should see "Content must be filled."
  And I fill in "Content" with "Hi Yuankai, This is Lisa, glad to offer you my help!"
  And I press "Submit"
  Then I should be on the replies page for post subject "Too many A+"
  And I should see "Hi Yuankai, This is Lisa, glad to offer you my help!"
