Feature: Adding tags
  In order to be able to work out the type of material on a website
  I want to see the categories of the linsk I have previously saved

Scenario: Adding tags
  Given I am on the 'Add link' page
  When I fill in "name" with "TED"
  And I fill in "url" with "http://www.ted.com"
  And I fill in "description" with "Amazing talks"
  And I fill in "tags" with "education, inspiring"
  And I press "save"
  Then I should see "TED"

Scenario: Adding tags
  Given I am on the 'Add link' page
  When I fill in "name" with "TED"
  And I fill in "url" with "http://www.ted.com"
  And I fill in "description" with "Amazing talks"
  And I fill in "tags" with "education, inspiring"
  And I press "save"
  Then I should see "education"
  When I follow "education"
  Then I should see "TED"