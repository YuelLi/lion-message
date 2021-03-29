# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name
      
    when /^the login page$/ then '/login'
    when /^the home page$/ then '/'
    when /^the posts page$/ then posts_path
    when /^the sign up page$/ then '/users/new'
    when /^the create post page$/ then new_post_path
    when /^logout$/ then '/logout'
    when /^user$/ then '/user'
    when /^the replies page$/ then '/posts/2/replies'
    when /^the replies page for post subject "(.*)"$/ then
      post = Post.where(subject: $1).take
      '/posts/'+post.id.to_s+'/replies'
    when /^the show page for subject "(.*)"$/ then
      post = Post.where(subject: $1).take
      post_path(post)
    when /^the edit page for subject "(.*)"$/ then
      post = Post.where(subject: $1).take
      edit_post_path(post)

    # when /^the details page for "(.*)"$/ then
    #   movie_id = Movie.find_by(title: $1).id
    #   movie_path(movie_id)
    
    # when /^the Similar Movies page for "(.*)"$/ then
    #   movie_id = Movie.find_by(title: $1).id
    #   movies_by_director_path(movie_id)
      
    # when /^the (RottenPotatoes )?home\s?page$/ then '/movies'

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
