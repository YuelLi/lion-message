# Features
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
