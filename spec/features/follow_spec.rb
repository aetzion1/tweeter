require 'rails_helper'

RSpec.describe('Dashboard') do
  describe 'as an authenticated user' do
    before :each do
      @buffy = User.create!(username: 'BuffyVamp', email: "buffyslayer@example.com", password: "test")
      @michael = User.create!(username: 'michael1', email: "mike@example.com", password: "test")
    end

    it "should follow and unfollow a user" do
      expect(@michael.following?(@michael)).to equal(false)
      @michael.follow(@buffy)
      assert @michael.following?(@buffy)
      assert @buffy.followers.include?(@michael)
      @michael.unfollow(@buffy)
      expect(@michael.following?(@buffy)).to equal(false)
    end
  end
end
