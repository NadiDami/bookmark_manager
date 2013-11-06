Feature: Viewing links
  In order to avoid having to remember many things
  As a person who enjoys surfing the web
  I want to see the links I have previously saved 

  Scenario: Viewing links
    Given I have saved the following link:
    |name           |url                          |description                 |
    |StoryGraph     |https://www.thestorygraph.com|Creative writing by students|
    And I am on the homepage
    Then I should see "StoryGraph"
