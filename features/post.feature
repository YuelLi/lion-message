Feature: browse posts

  As a student, I can login to lion-message.
  Also, I can see my post.

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

Scenario: login and see my posts
  Given I am on the home page
  And I press "Login"
  Then I should be on the login page
  When I fill in "username" with "Yuankai"
  And I fill in "password" with "yuankai1234"
  And I press "Login"
  Then I should be on the posts page
  And I should see "Yuankai"
  And I should see "Too many A+"
  And I should see "Rats invation"
  And I should not see "Minhe"
  And I should not see "Too poor."
  And I should not see "More sushi."

Scenario: login and create a post
  Given I am on the home page
  And I press "Login"
  Then I should be on the login page
  When I fill in "username" with "Yuankai"
  And I fill in "password" with "yuankai1234"
  And I press "Login"
  Then I should be on the posts page
  And I press "Create a new post"
  Then I should be on the create post page
  And I select "topic" with "Finance"
  And I select "department" with "ISSO"
  And I fill in "subject" with "s"
  And I fill in "body" with "I am too rich."
  And I press "Submit"
  Then I should be on the posts page
  And I should see "Columbia Finance"
  And I should see "I am too rich."

Scenario: login and create a post with empty body
  Given I am on the home page
  And I press "Login"
  Then I should be on the login page
  When I fill in "username" with "Yuankai"
  And I fill in "password" with "yuankai1234"
  And I press "Login"
  Then I should be on the posts page
  And I press "Create a new post"
  Then I should be on the create post page
  And I select "topic" with "Finance"
  And I select "department" with "Computer Science"
  And I fill in "subject" with "s"
  And I fill in "body" with ""
  And I press "Submit"
  Then I should be on the create post page
  And I should see "Department, Subject and Body must be filled."