Feature: browse posts

  As a student, I can login to lion-message.
  Also, I can see my post.

Background: having users and posts in database

  Given the following users exist:
  | username | password        | role    |
  | Minhe    | minhe1234       | student |
  | Yuankai  | yuankai1234     | student |

  Given the following posts exist:
  | topic    | subject        | body            | department              | user_id |
  | finance  | Too poor       | I am so poor!   | Columbia Finance        | 1       |
  | dining   | More sushi     | More sushi.     | Computer Science        | 1       |
  | academic | Too many A+    | Too many A+.    | Electrical Engineering  | 2       |
  | housing  | Rats invation  | Rats invation.  | ISSO                    | 2       |

  Given the following departments exist:
  | name                    |
  | Computer Science        |
  | Electrical Engineering  |
  | Columbia Finance        |
  | ISSO                    |

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
  And I select "department" with "Columbia Finance"
  And I fill in "subject" with "s"
  And I fill in "body" with "I am too rich."
  And I press "Submit"
  Then I should be on the posts page
  And I should see "Columbia Finance"
  And I should see "s"

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

Scenario: login and try to access to other's post
  Given I am on the home page
  And I press "Login"
  Then I should be on the login page
  When I fill in "username" with "Yuankai"
  And I fill in "password" with "yuankai1234"
  And I press "Login"
  Then I should be on the posts page
  When I go to the show page for subject "Too poor"
  And I should be on the posts page
  Then I should see "unauthorized access!"
  And I go to the edit page for subject "Too poor"
  And I should be on the posts page
  Then I should see "unauthorized access!"

Scenario: login and edit a post body
  Given I am on the home page
  And I press "Login"
  Then I should be on the login page
  When I fill in "username" with "Yuankai"
  And I fill in "password" with "yuankai1234"
  And I press "Login"
  Then I should be on the posts page
  When I go to the show page for subject "Too many A+"
  Then I should see "Too many A+."
  And I press "Edit post body"
  Then I should be on the edit page for subject "Too many A+"
  And I fill in "body" with "Body edited!"
  And I press "Submit"
  Then I should be on the show page for subject "Too many A+"
  And I should see "Body edited!"