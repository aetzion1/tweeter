require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'reationships' do
    it {have_many :posts}
  end

  describe 'validations' do
    it {should validate_presence_of :email}
    it {should validate_uniqueness_of :email}
    it {should validate_presence_of :password}
    it {should validate_presence_of :username}
  end
end
