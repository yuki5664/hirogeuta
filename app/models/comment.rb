class Comment < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :micropost
  belongs_to :user
  validates :body, presence: true, length: { maximum: 140}
end
