require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'reationships' do
    it {should belong_to :user}
  end

  describe 'validations' do
    it {should validate_presence_of :text}
    it {should validate_presence_of :user_id}
    it {should validate_presence_of :likes}
    it {should validate_presence_of :reposts}
  end
  
end
