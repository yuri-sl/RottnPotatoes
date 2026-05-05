Feature: Create Movie
  As a user
  I want to create a new movie
  So that the system can store movies

Scenario: create a new movie
  Given I am on the index page
  When I click the add Movie button
  Then I should be redirected to new movie page
  And I should input data into the form fields
  And I should press the Create Movie button
  And I should be redirected to index page