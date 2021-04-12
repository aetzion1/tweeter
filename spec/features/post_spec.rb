require 'rails_helper'

RSpec.describe "new post" do
    before(:each) do
      @user = User.create!(username: 'BuffyVamp', email: "buffyslayer@example.com", password: "test")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      @post1 = Post.create!(text: 'My first tweet', user_id: @user.id)
    end

    describe "happy path" do
      it "can create new post" do
          visit dashboard_path

          fill_in :text, with: 'My shiny new post'

          click_button 'Submit Post'

          expect(current_path).to eq(dashboard_path)

          within('.posts') do
            expect(page).to have_content('My shiny new post')
            expect(page).to have_content(@user.username)
        end
      end
    end

    describe 'sad path' do
        it 'returns flash message if post is blank' do
          visit dashboard_path

          fill_in :text, with: ''

          click_button 'Submit Post'

          expect(current_path).to eq(dashboard_path)

          expect(page).to have_content("Try again")
        end
    end
end
