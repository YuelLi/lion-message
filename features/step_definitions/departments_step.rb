Given /the following departments exist/ do |departments_table|
  departments_table.hashes.each do |department|
    Department.create department
  end
end