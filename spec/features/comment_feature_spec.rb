require 'rails_helper'
include Integration

feature 'Comment' do
    context 'Create comments' do
      before(:each) do
        visit '/users/sign_up'
        sign_up
        click_link 'skip'
      end

      scenario 'create new chirp and comment' do
        within('form') do
          fill_in 'chirp-content', with: 'Hey! im a chirp'
        end
        find('input[name="commit"]').click
        within('form#chirp-comment-form') do
            fill_in 'comment-content', with: "Hey! im a chirp's comment"
        end
        find('input[value="Comment"]').click
        expect(page).to have_content("Hey! im a chirp's comment")
      end

      scenario 'delete a comment' do
        within('form') do
          fill_in 'chirp-content', with: 'Hey! im a chirp'
        end
        find('input[name="commit"]').click
        within('form#chirp-comment-form') do
            fill_in 'comment-content', with: "Hey! im a chirp's comment"
        end
        find('input[value="Comment"]').click
        first(:css, ".delete_link_trash").click
        expect(page).to_not  have_content("Hey! im a chirp's comment")
      end
    end
  end