require 'rails_helper'

RSpec.describe('User Login') do
  describe 'happy path' do
    it 'Welcome page should display welcome message' do
      visit root_path

      expect(page).to have_content('Welcome to Tweeter')
    end

    it 'Welcome page should have a Log In button that takes us to the login form' do
      visit root_path

      expect(page).to have_link('Log In')

      click_link('Log In')

      expect(current_path).to eq(login_path)
    end

    it 'allows users to login' do
      user = User.create(username: 'BuffyVamp', email: "buffyslayer@example.com", password: "test")

      visit root_path

      click_link 'Log In'

      expect(current_path).to eq(login_path)

      fill_in :email, with: user.email.upcase
      fill_in :password, with: user.password

      click_button 'Log In'

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Welcome, #{user.username}")
      expect(page).to have_link("Log out")
      expect(page).to_not have_link("Register Here")
      expect(page).to_not have_link("Log In")

      click_link 'Log out'

      expect(current_path).to eq(root_path)

      expect(page).to have_content('Log Out Successful')
      expect(page).to have_link("Register Here")
      expect(page).to have_link("Log In")
    end

    it 'Welcome page should redirect user to the dashboard page if they have already logged in' do
      user = User.create(username: 'BuffyVamp', email: "buffyslayer@example.com", password: "test")

      visit root_path

      click_link('Log In')

      fill_in :email, with: user.email.upcase
      fill_in :password, with: user.password

      click_button 'Log In'

      expect(current_path).to eq(dashboard_path)

      visit root_path

      expect(current_path).to eq(dashboard_path)
    end
  end

  describe 'sad path' do
    it 'block login if bad credentials' do
        user = User.create(username: 'BuffyVamp', email: "buffyslayer@example.com", password: "test")

        visit root_path

        click_link 'Log In'

        expect(current_path).to eq(login_path)

        fill_in :email, with: user.email
        fill_in :password, with: 'bad password'

        click_button 'Log In'

        expect(current_path).to eq(login_path)
        expect(page).to have_content("Please check your credentials and try again!")
    end
  end
end
