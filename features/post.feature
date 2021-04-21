Feature: browse posts

  As a student or faculty, I can login to lion-message.
  Also, I can see my post.

Background: having users and posts in database

  Given the following users exist:
  | username | password        | role    |  department           |
  | Minhe    | minhe1234       | student |  Computer Science     |
  | Yuankai  | yuankai1234     | student |  Computer Science     |
  | A        | 123456          | faculty |  Computer Science     |
  | B        | 123456          | faculty |  Columbia Finance     |

  Given the following posts exist:
  | topic    | subject        | body            | department              | user_id | tag            |
  | Dining   | More sushi     | More sushi.     | Computer Science        | 1       | Post created   |
  | Finance  | Too poor       | I am so poor!   | Columbia Finance        | 1       | Post created   |
  | Course   | Too many A+    | Too many A+.    | Electrical Engineering  | 2       | Post created   |
  | Housing  | Rats invation  | Rats invation.  | Computer Science        | 2       | Reply in 1 day |

  Given the following departments exist:
  | name                    |
  | Computer Science        |
  | Electrical Engineering  |
  | Columbia Finance        |
  | ISSO                    |

Scenario: As a student, login and see my posts
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
  Then I follow "Department"
  And I should see "Rats invation" before "Too many A+"
  Then I fill in "post_content" with "A+"
  And I press "Search"
  Then I should not see "rats invation"

Scenario: As a faculty, login and see my posts
  Given I am on the home page
  And I press "Login"
  Then I should be on the login page
  When I fill in "username" with "A"
  And I fill in "password" with "123456"
  And I press "Login"
  Then I should be on the posts page
  And I should see "More sushi"
  And I should see "Rats invation"
  And I should not see "Minhe"
  And I should not see "Too poor"
  And I should not see "Too many A+"

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
  And I fill in "body" with ""
  And I press "Submit"
  Then I should be on the edit page for subject "Too many A+"
  And I should see "Body must be filled."
  And I fill in "body" with "Body edited!"
  And I press "Submit"
  Then I should be on the show page for subject "Too many A+"
  And I should see "Body edited!"

Scenario: filter by topics
  Given I am on the home page
  And I press "Login"
  Then I should be on the login page
  When I fill in "username" with "Yuankai"
  And I fill in "password" with "yuankai1234"
  And I press "Login"
  Then I should be on the posts page
  And I should see "Too many A+"
  And I should see "Rats invation"
  And I filter by topic "Course"
  Then I should see "Too many A+"
  And I should not see "Rats invation"

Scenario: filter by tags
  Given I am on the home page
  And I press "Login"
  Then I should be on the login page
  When I fill in "username" with "Yuankai"
  And I fill in "password" with "yuankai1234"
  And I press "Login"
  Then I should be on the posts page
  And I should see "Too many A+"
  And I should see "Rats invation"
  And I filter by tag "Post created"
  Then I should see "Too many A+"
  And I should not see "Rats invation"

Scenario: As a faculty, login and add tag
  Given I am on the home page
  And I press "Login"
  Then I should be on the login page
  When I fill in "username" with "B"
  And I fill in "password" with "123456"
  And I press "Login"
  Then I should be on the posts page
  And I should see "Too poor"
  Then I press "Detail"
  And I press "Add tag"
  And I press "Reply in 1 day"
  Then I should see "Reply in 1 day"

Scenario: As a faculty, login and add tag
  Given I am on the home page
  And I press "Login"
  Then I should be on the login page
  When I fill in "username" with "B"
  And I fill in "password" with "123456"
  And I press "Login"
  Then I should be on the posts page
  And I should see "Too poor"
  Then I press "Detail"
  And I press "Add tag"
  And I press "Reply in 1 day"
  Then I should see "Reply in 1 day"
