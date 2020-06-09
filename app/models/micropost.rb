class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :artist, presence: true, length: { maximum: 50 }
  validates :song, presence: true, length: { maximum: 50 }
  validates :youtube_url, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 250 }
end