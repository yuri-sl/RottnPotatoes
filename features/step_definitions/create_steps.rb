# frozen_string_literal: true

Given /I am on the index page/ do
  visit('/')
end

When /I click the add Movie button/ do
  click_link('Novo Filme')
end

Then /I should be redirected to add new movie page/ do
  expect(current_path).to eq('/movies/add')
end

And /I should input data into the form fields/ do
  fill_in 'Título', with: 'The Godfather'
  select 'R', from: 'Classificação'
  fill_in 'Data de Lançamento', with: '1972-03-24'
  # fill_in 'Descrição', with: 'An organized crime dysnasty'
end


And /I should press the Create Movie button/ do
  click_button 'Adicionar filme'
end

And /I should be redirected to index page/ do
  visit('/movies')
end


When /I fill in "([^"]*)" with "([^"]*)"/ do |field, value|
  fill_in field, with: value
end

# Clicar em um link pelo texto
When /I click "([^"]*)"/ do |link|
  click_link link
end

# Verificar se está na página de criar novo filme
Then /I should be redirected to add movie page/ do
  expect(current_path).to eq(movies_add_path)
end

# Verificar se está na home
Then /I should be on the RottenPotatoes home page/ do
  expect(current_path).to eq(movies_path)
end

# Verificar ordem dos filmes na página
Then /I should see "([^"]*)" before "([^"]*)"/ do |first, second|
  content = page.body
  first_pos  = content.index(first)
  second_pos = content.index(second)
  expect(first_pos).to be < second_pos,
                       "Expected '#{first}' to appear before '#{second}'"
end


Given /the following movies exist:/ do |table|
  table.hashes.each do |movie|
    Movie.create!(movie)
  end
end

When /I visit the movie list sorted by title/ do
  visit movies_path(sort_by: 'title', sort_order: 'asc')
end

When /I select "([^"]*)" from "([^"]*)"/ do |value, field|
  select value, from: field
end

When /I press "([^"]*)"/ do |button|
  click_button button
end