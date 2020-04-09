require 'rails_helper'

feature 'Chirp' do
  include Integration
  context 'Liking chirps' do
    before(:each) do
      visit '/users/sign_up'
      sign_up
      click_link 'skip'
      within('form') do
        fill_in 'chirp-content', with: 'Hey! im a chirp'
      end
      find('input[name="commit"]').click
    end

    scenario 'Expect to chirp have 0 likes' do
      expect(page).to have_content('0 likes')
    end

    scenario 'Like a chirp' do
      expect(page).to have_content('0 likes')
      first(:css, '.like-heart').click
      expect(page).to have_content('1 like')
    end

    scenario 'Dislike a chirp' do
      expect(page).to have_content('0 likes')
      first(:css, '.like-heart').click
      first(:css, '.like-broken-heart').click
      expect(page).to have_content('0 likes')
    end
  end
end
