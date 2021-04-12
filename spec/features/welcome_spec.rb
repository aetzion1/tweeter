require 'rails_helper'

RSpec.describe('Welcome Page') do
  describe 'happy path' do
    it 'should display the welcome page with message' do
      visit root_path

      expect(page).to have_content('Welcome to Tweeter')
    end

    xit 'should have a Log In button that takes us to the login form' do
      visit root_path

      expect(page).to have_link('Log In')

      click_link('Log In')

      expect(current_path).to eq(login_path)
    end

    xit 'should redirect user to the dashboard page if they have already logged in' do
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
end
