require 'rails_helper'

RSpec.describe Relationship, type: :model do
  describe 'relationships' do
    it {belong_to :follower}
    it {belong_to :followed}
  end

  describe 'validations' do
    before :each do
      @relationship = Relationship.new(follower_id: 1, followed_id: 2)
    end
    it {should validate_presence_of :follower_id}
    it {should validate_presence_of :followed_id}
  end

  it "should be valid" do
    assert @relationship.valid?
  end

  it "should require a follower_id" do
    @relationship.follower_id = nil
    assert_not @relationship.valid?
  end

  it "should require a followed_id" do
    @relationship.followed_id = nil
    assert_not @relationship.valid?
  end
end
