require 'rails_helper'
include Integration


RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http redirection if not logged in' do
      get '/users/index'
      expect(response).to have_http_status(302)
    end
  end

  describe 'GET /show' do
    it 'returns http redirection if not logged in' do
      get '/users/show'
      expect(response).to have_http_status(302)
    end
  end
end

feature 'User' do
  context 'Sign up' do
    before(:each) do
      visit '/users/sign_up'
    end

    scenario 'successfully sign up' do
      sign_up
      expect(page).to have_content('Almost ready!')
    end

    scenario 'successfully home' do
      sign_up
      click_link 'skip'
      expect(page).to have_content('Home')
    end

    scenario 'successfully route to profile' do
      sign_up
      click_link 'skip'
      click_link 'Profile'
      expect(page).to have_content('Followed by')
    end

    scenario 'successfully route to future feature' do
      sign_up
      click_link 'skip'
      click_link 'Connect'
      expect(page).to have_content("This feature will be available in future releases, we'll keep you updated.")
    end

    scenario 'successfully log out' do
      sign_up
      click_link 'skip'
      log_out
      expect(page).to have_content('Log in')
    end

    scenario 'successfully log in' do
      sign_up
      click_link 'skip'
      log_out
      log_in
      expect(page).to have_content('Signed in successfully.')
    end

    scenario 'with blank name' do
      fill_in 'username', with: ''
      find('input[name="commit"]').click
      expect(page).to have_content("can't be blank")
    end
  end
end
