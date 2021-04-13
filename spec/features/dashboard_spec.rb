require 'rails_helper'

RSpec.describe('Dashboard') do
  describe 'happy path' do
    describe 'as an authenticated user' do
      before :each do
        @user1 = User.create!(username: 'BuffyVamp', email: "buffyslayer@example.com", password: "test")
        @user2 = User.create!(username: 'Mike1', email: "mike@example.com", password: "test")
        @user3 = User.create!(username: 'lanabanana', email: "lana@example.com", password: "test")

        visit login_path

        fill_in :email, with: @user1.email.upcase
        fill_in :password, with: @user1.password

        click_button 'Log In'

        # Logging In Redirects to Dashboard
      end

      it "should display 'Welcome <username>!' at the top of page" do
        expect(page).to have_content("Welcome, #{@user1.username}")
      end

      it "should have a button to submit a post" do
        expect(page).to have_button('Submit Post')
      end

      it 'should display all of the users tweets' do
        post1 = Post.create!(text: 'My first tweet', user_id: @user1.id)
        post2 = Post.create!(text: 'My second tweet', user_id: @user1.id)
        post3 = Post.create!(text: 'My latest tweet', user_id: @user1.id)
        visit dashboard_path

        expect(page).to have_content('My Posts:')
        expect(page).to have_selector("section[class='posts']")

        within("#post-#{post1.id}") do
          expect(page).to have_content(post1.text)
          expect(page).to have_content(post1.user.username)
          expect(page).to have_content(post1.strftime)
        end
      end

      it "feed should have the right posts" do
        # Posts from followed user
        @user3.posts.each do |post_following|
          assert @user1.feed.include?(post_following)
        end
        # Posts from self
        @user1.posts.each do |post_self|
          assert @user1.feed.include?(post_self)
        end
        # Posts from unfollowed user
        @user2.posts.each do |post_unfollowed|
          assert_not @user1.feed.include?(post_unfollowed)
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
