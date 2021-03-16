# Lion Message: COMSW4156 Project
## Team Members
* Yuankai Xu yx2622
* Yu Li yl4736
* Minhe Zhang mz2864
* Yen-Lin Chen yc3936
## Running Instructios
1. Install yarn & WebPacker
    * [The tutorial we used](https://yarnpkg.com/en/docs/install).
2. Basic

      cd lion-message \
      bundle install --without production
3. Database

      rails db:migrate RAILS_ENV=development

## User Stories
All the cucumber files is under `lion-message/features`
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
All the Rspec files is under `lion-message/spec`

## SaaS Prototype & Features
The whole folder is the source file of our Saas prototype.
### Features:
* Sign up
* Login
* Logout
* Create posts

## Heroku Deployment Link
[Try Lion Message!!!](dry-dawn-64360.herokuapp.com)

## Reference
* [Webpacker Installation](https://yarnpkg.com/en/docs/install).
* [Authentication Guide with Ruby on Rails](https://levelup.gitconnected.com/simple-authentication-guide-with-ruby-on-rails-16a6255f0be8).