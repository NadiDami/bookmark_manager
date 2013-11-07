require 'spec_helper' 

feature "Links" do

  scenario 'can be filtered by tags'  do
    Link.create(:url => "http://www.example.com",
                :name => "Example", 
                :tags => [Tag.first_or_create(:text => 'education')])
    Link.create(:url => "http://www.blah.com", 
                :name => "Blah", 
                :tags => [Tag.first_or_create(:text => 'search')])
    visit '/tags/search'
    expect(page).not_to have_content("Example")
    expect(page).to have_content("Blah")
  end

  

end