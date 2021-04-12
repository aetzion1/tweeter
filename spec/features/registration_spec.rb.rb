require 'rails_helper'

RSpec.describe 'User Registration' do
    describe 'happy path' do
      it 'welcome page should have a registration link that takes us to the registration page' do
        visit root_path
  
        expect(page).to have_link('Register Here')
  
        click_link('Register Here')
  
        expect(current_path).to eq(new_user_path)
      end
  
      it 'allows a user to register' do
          visit root_path

          click_link 'Register Here'

          expect(current_path).to eq(new_user_path)

          email = 'buffyslayer@example.com'
          username = 'BuffyVamp'
          password = 'test'

          fill_in :email, with: email
          fill_in :username, with: username
          fill_in :password, with: password
          fill_in :password_confirmation, with: password

          click_button 'Create User'

          expect(current_path).to eq(dashboard_path)
          expect(page).to have_content("Welcome, #{username}")
      end
  end

  describe 'sad path' do
      it 'rejects registration without password confirmation' do
          visit root_path
          click_link 'Register Here'

          email = 'buffyslayer@example.com'
          username = 'BuffyVamp'
          password = 'test'

          fill_in :email, with: email
          fill_in :username, with: username
          fill_in :password, with: password

          click_button 'Create User'

          expect(current_path).to eq(new_user_path)
          expect(page).to have_content("Your credentials need some work, my friend!")
      end
      
      it 'rejects registration with non-matching password confirmation' do
          visit root_path
          click_link 'Register Here'

          email = 'buffyslayer@example.com'
          username = 'BuffyVamp'
          password = 'test'

          fill_in :email, with: email
          fill_in :username, with: username
          fill_in :password, with: password
          fill_in :password_confirmation, with: 'Test'

          click_button 'Create User'

          expect(current_path).to eq(new_user_path)
          expect(page).to have_content("Your credentials need some work, my friend!")
      end
    end
end
