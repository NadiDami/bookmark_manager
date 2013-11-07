require 'spec_helper' 

describe Link, :type => :feature do

  it 'can be filtered by tags'  do
    Link.create(:url => "http://www.makersacademy.com",
                :name => "Makers Academy", 
                :tags => [Tag.first_or_create(:text => 'education')])
    Link.create(:url => "http://www.google.com", 
                :name => "Google", 
                :tags => [Tag.first_or_create(:text => 'search')])
     visit '/tags/search'
    expect(page).not_to have_content("Makers Academy")
    expect(page).to have_content("Google")
  end

  

end