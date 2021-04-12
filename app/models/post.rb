class Post < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :text, presence: true
  validates :likes, presence: true
  validates :reposts, presence: true

  scope :sorted, -> { order(created_at: :desc) }

  def strftime
    created_at.strftime('%b %d, %Y')
  end


end
