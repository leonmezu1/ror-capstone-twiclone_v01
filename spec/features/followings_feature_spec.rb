require 'rails_helper'
feature 'Following' do
  include Integration
  context 'Find follow and unfollow users' do
    before(:each) do
      visit '/users/sign_up'
      sign_up
      click_link 'skip'
      within('form') do
        fill_in 'chirp-content', with: 'Hey! im a chirp'
      end
      find('input[name="commit"]').click
      log_out
      sign_up_second
      click_link 'skip'
      visit root_path
    end

    scenario 'Expect to see first user' do
      expect(page).to have_content('@leonmezu1')
    end

    scenario 'Follow first user' do
      first(:css, '.follow-btn').click
      expect(page).to have_content('You are following @leonmezu1')
    end

    scenario 'See first users post' do
      first(:css, '.follow-btn').click
      expect(page).to have_link('@leonmezu1 David Lobato')
    end

    scenario 'Unfollow user' do
      first(:css, '.follow-btn').click
      click_link('@leonmezu1 David Lobato')
      first(:css, '.follow-btn').click
      expect(page).to have_content("You wont't see @leonmezu1 chirps")
    end
  end
end
