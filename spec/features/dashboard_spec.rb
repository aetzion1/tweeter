require 'rails_helper'

RSpec.describe('Dashboard') do
  describe 'happy path' do
    describe 'as an authenticated user' do
      before :each do
        @user = User.create!(username: 'BuffyVamp', email: "buffyslayer@example.com", password: "test")

        visit login_path

        fill_in :email, with: @user.email.upcase
        fill_in :password, with: @user.password

        click_button 'Log In'

        # Logging In Redirects to Dashboard
      end

      it "should display 'Welcome <username>!' at the top of page" do
        expect(page).to have_content("Welcome, #{@user.username}")
      end

      xit "should have a button to 'Post Tweet'" do
        expect(page).to have_button('Post Tweet')
      end

      it 'should display all of the users tweets' do
        post1 = Post.create!(text: 'My first tweet', user_id: @user.id)
        post2 = Post.create!(text: 'My second tweet', user_id: @user.id)
        post3 = Post.create!(text: 'My latest tweet', user_id: @user.id)
        visit dashboard_path

        expect(page).to have_content('My Posts:')
        expect(page).to have_selector("section[class='posts']")

        within("#post-#{post1.id}") do
          expect(page).to have_content(post1.text)
          expect(page).to have_content(post1.user.username)
          expect(page).to have_content(post1.strftime)
        end
      end
    end
  end

  describe 'sad path' do
    describe 'when I am NOT an authenticated user' do
      before :each do
        visit dashboard_path
      end

      it 'should redirect back to the log in page' do
        expect(current_path).to eq(login_path)
      end

      it "should give a 'You Must Log In To Visit Your Dashboard' notice" do
        expect(page).to have_content('You Must Log In To Visit Your Dashboard')
      end
    end
  end
end
