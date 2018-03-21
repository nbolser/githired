require 'rails_helper'

describe 'Searches', type: :feature do
  scenario 'When visiting projec root' do
    visit root_path
    expect(page).to have_content('GitHired')
    expect(page).to have_css('input#search_keyword')
    expect(page).to have_selector(:button, 'Search Jobs')
  end

  scenario 'When visiting index page' do
    visit searches_path
    expect(page).to have_content('GitHired')
    expect(page).to have_css('input#search_keyword')
    expect(page).to have_selector(:button, 'Search Jobs')
  end

  xscenario 'When visiting index page and performing a search', js: true do
    visit searches_path
    within('.search-form') do
      fill_in 'search_keyword', with: 'Rails'
      click_button 'Search Jobs'
      expect(page).to have_content 'Results'
    end
  end
end
