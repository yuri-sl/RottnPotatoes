# frozen_string_literal: true

Given /I am on the index page/ do
  visit('/')
end

When /I click the add Movie button/ do
  click_link('Novo Filme')
end

Then /I should be redirected to new movie page/ do
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