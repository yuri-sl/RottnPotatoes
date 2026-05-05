Feature: Create Movie
  As a user
  I want to create a new movie
  So that the system can store movies

Scenario: create a new movie
  Given I am on the index page
  When I click the add Movie button
  Then I should be redirected to add new movie page
  And I should input data into the form fields
  And I should press the Create Movie button
  And I should be redirected to index page

  Scenario: View movie list after adding 2 movies (Imperative)
    Given I am on the index page
    When I click "Novo Filme"
    Then I should be redirected to add movie page
    When I fill in "Título" with "Zorro"
    And I fill in "Data de Lançamento" with "1998-07-17"
    And I select "PG" from "Classificação"
    And I press "Adicionar filme"
    Then I should be on the RottenPotatoes home page
    When I click "Novo Filme"
    Then I should be redirected to add movie page
    When I fill in "Título" with "Apocalypse Now"
    And I fill in "Data de Lançamento" with "1979-08-15"
    And I select "R" from "Classificação"
    And I press "Adicionar filme"
    Then I should be on the RottenPotatoes home page
    When I click "Título"
    Then I should see "Apocalypse Now" before "Zorro"



Scenario: View movie list sorted alphabetically (Declarative)
  Given the following movies exist:
    | title          | rating | release_date |
    | Zorro          | PG     | 1998-07-17   |
    | Apocalypse Now | R      | 1979-08-15   |
  When I visit the movie list sorted by title
  Then I should see "Apocalypse Now" before "Zorro"