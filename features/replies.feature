Feature: browse posts

  As a student, I can login to lion-message.
  Also, I can reply to a post.

Background: having users and posts in database

  Given the following users exist:
  | username | password        | role    |
  | Minhe    | minhe1234       | student |
  | Yuankai  | yuankai1234     | student |

  Given the following posts exist:
  | topic    | subject        | body            | department  | user_id |
  | finance  | Too poor       | Too poor.       | CS          | 1       |
  | dining   | More sushi     | More sushi.     | BIO         | 1       |
  | academic | Too many A+    | Too many A+.    | MATH        | 2       |
  | housing  | Rats invation  | Rats invation.  | HIST        | 2       |

Scenario: login and reply to a posts
  Given I am on the home page
  And I press "Login"
  Then I should be on the login page
  When I fill in "username" with "Yuankai"
  And I fill in "password" with "yuankai1234"
  And I press "Login"
  Then I should be on the posts page
  And I press "Detail"
  Then I should be on the post detail page
  And I press "Send Reply"
  Then I should be on the post reply page
  And I fill in "content" with "This is a reply sample"
  And I press "Send"
  Then I should be on the user reply page
  And I should see "This is a reply sample"