Given /the following posts exist/ do |posts_table|
  posts_table.hashes.each do |post|
    Post.create post
  end
end