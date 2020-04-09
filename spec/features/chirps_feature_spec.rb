require 'rails_helper'
include Integration

feature 'Chirp' do
  context 'Create chirps' do
    before(:each) do
      visit '/users/sign_up'
      sign_up
      click_link 'skip'
    end

    scenario 'create new chirp' do
      within('form') do
        fill_in 'chirp-content', with: 'Hey! im a chirp'
      end
      find('input[name="commit"]').click
      expect(page).to have_content('Hey! im a chirp')
    end

    scenario 'delete a chirp' do
      within('form') do
        fill_in 'chirp-content', with: 'Hey! im a chirp'
      end
      find('input[name="commit"]').click
      click_link('Delete chirp')
      expect(page).not_to have_content('Hey! im a chirp')
    end
  end
end
