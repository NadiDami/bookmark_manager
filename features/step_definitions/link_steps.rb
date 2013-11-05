Then(/^I should see:$/) do |link|
  link.hashes.each do |link|
    Link.create(link)
  end
end
