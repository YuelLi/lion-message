# Lion Message
It is a final project of COMSW4156 Spring 2021. \
[Github Repository](https://github.com/YuelLi/lion-message)\
[Demo Video](https://youtu.be/2hTezu5oy_k)\
[Heroku Deployment Link](https://dry-dawn-64360.herokuapp.com/)
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

      `bundle exec rake db:migrate:reset` \
      `bundle exec rake db:seed`

## Product Testing Instructions
In our Heroku deployment, you can use:
```
username: minhezhangmz2864
password: 123456
```
to test student account features,
```
username: cs1
password: 123456
```
to test faulty account features.

Both accounts have some existing data.
## Test Coverage
Iteration 2: 100%

## User Stories
All the cucumber files are under `lion-message/features`. Examples:
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
* Edit posts
* Reply to posts
* Edit reply
* Search posts
* Filter posts by topic
* Filter posts by tag
* Add tag to post (faculty)
* Sort posts by department
* Sort post by created time

## Heroku Deployment Link
[Try Lion Message!!!](http://dry-dawn-64360.herokuapp.com)

## Reference
* [Webpacker Installation](https://yarnpkg.com/en/docs/install).
* [Authentication Guide with Ruby on Rails](https://levelup.gitconnected.com/simple-authentication-guide-with-ruby-on-rails-16a6255f0be8).
* [Heroku Database](https://stackoverflow.com/questions/4820549/how-to-empty-a-heroku-database)
* [Rails Database Command](https://stackoverflow.com/questions/10301794/difference-between-rake-dbmigrate-dbreset-and-dbschemaload)
* [Nested Route in Rails](https://stackoverflow.com/questions/25219534/what-are-nested-routes-for-in-railss)
* [Nested Route in Rails Official](https://guides.rubyonrails.org/routing.html)


# Development Document

These information are for team members only. Feel free to ignore!


## Deployment Command
1. Login to Heroku: `heroku login --interactive`.
2. Push code to Heroku: `git push heroku master`.
3. Drop db: `heroku pg:reset`
4. Migration: `heroku run rake db:migrate`.
5. Generate data from seed: `heroku run rake db:seed`

## Iteration 2

### User
* User profile 

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

### Test Ongoing

## Iteration 3

### Notification
* Updating email to students

### Test Finished
