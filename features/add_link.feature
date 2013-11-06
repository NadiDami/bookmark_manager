Feature: Adding links
  In order to be able to revisit websites I enjoy
  As a person who has many such websites to remember
  I want to see the links I have previously saved 

  Scenario: Adding links
    Given I am on the 'Add link' page
    When I fill in "name" with "TED"
    And I fill in "url" with "http://www.ted.com"
    And I fill in "description" with "Amazing talks"
    And I press "save"
    Then I should see "TED"
