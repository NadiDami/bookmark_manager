Feature: View homepage
  In order to see something
  As a visitor
  I need some sort of UI

  Scenario: The header
    Given I am on the homepage
    Then I should see "Bookmark Manager" within "header"
    Then I should see "Sign up" within "header"
    Then I should see "Sign in" within "header"
    
  Scenario: The footer
    Given I am on the homepage
    Then I should see "Makers Academy"
    Then I should see "I built this page at Makers Academy"





