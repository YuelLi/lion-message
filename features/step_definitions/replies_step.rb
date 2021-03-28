Given /the following posts for reply exist/ do |posts_table|
  posts_table.hashes.each do |post|
    Post.create post
  end
end