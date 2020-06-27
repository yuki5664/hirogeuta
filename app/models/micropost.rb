class Micropost < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :artist, presence: true, length: { maximum: 50 }
  validates :song, presence: true, length: { maximum: 50 }
  validates :youtube_url, presence: true
  validates :content, presence: true, length: { maximum: 250 }

  # boardのお気に入り判定 → vies側で呼び出し
  def bookmark_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end
  
end
