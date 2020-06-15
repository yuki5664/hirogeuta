class Micropost < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :artist, presence: true, length: { maximum: 50 }
  validates :song, presence: true, length: { maximum: 50 }
  VALID_YOUTUBE_URL = /\A[a-zA-Z0-9]{11}+\z/
  validates :youtube_url, format: { with: VALID_YOUTUBE_URL }
  validates :content, presence: true, length: { maximum: 250 }
end
