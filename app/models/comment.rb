class Comment < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :micropost
  belongs_to :user
  has_many :notification, dependent: :destroy
  validates :body, presence: true, length: { maximum: 140}
end
