Given(/^I have saved the following link:$/) do |links|
  links.hashes.each do |link|
    Link.create(link)
  end
end


Then(/^I should see:$/) do |links|
  links.hashes.each do |link|
  end
end
