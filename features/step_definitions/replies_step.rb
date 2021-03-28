Given /the following posts exist/ do |posts_table|
  posts_table.hashes.each do |post|
    Reply.create post
  end
end