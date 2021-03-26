# Lion Message
It is a final project of COMSW4156 Spring 2021.
## Team Members
* Yuankai Xu yx2622
* Yu Li yl4736
* Minhe Zhang mz2864
* Yen-Lin Chen yc3936
## Running Instructions
1. Install yarn & WebPacker: [The tutorial we used](https://yarnpkg.com/en/docs/install).
2. Install Gems

      `bundle install --without production`
3. Database

      `rails db:migrate RAILS_ENV=development`

## User Stories
All the cucumber files are under `lion-message/features`
* If the user has not logged in, he can only access to login and signup page.
    * GET ```/users/new```: show the sign up page.
    * POST ```/users/create```: given the username and password, create a user account.
    * GET ```/sessions/new``` show the login page.
    * POST ```/sessions/create``` given the username and password, if they are valid, 
    set a session that indicates the user has logged in. If not, show an alert message and redirect to login page.
* Once a user has logged in, he can see all the post he has made and can create a new post.
    * GET ```/post/show```: show all the posts created by this user.
    * GET ```/post/new```: show create post page.
    * POST ```/post/create```: given the post parameters, create a new post which belongs to the current user.

## Unit Test
All the Rspec files are under `lion-message/spec`

## SaaS Prototype & Features
The whole folder `lion-message` is the source file of our Saas prototype.
### Features:
* Sign up
* Login
* Logout
* Create posts

## Heroku Deployment Link
[Try Lion Message!!!](http://dry-dawn-64360.herokuapp.com)

## Reference
* [Webpacker Installation](https://yarnpkg.com/en/docs/install).
* [Authentication Guide with Ruby on Rails](https://levelup.gitconnected.com/simple-authentication-guide-with-ruby-on-rails-16a6255f0be8).

## Iteration 2

### Faculty Features

* Login and logout

### Posts

* Sorting & filtering
* Topic and department mapping
* Status attribute

### Replies

* Model
* View (Ajax or new page)
* Controller

### Test

## Iteration 3

### Notification
* Updating email to students

### Statistic

### Evaluation