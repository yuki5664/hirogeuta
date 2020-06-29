class Micropost < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
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
  
  # いいね機能の通知
  def create_notification_like!(current_user)
    # すでに「いいね」されているか検索
    temp = Notification.where(["visitor_id = ? and visited_id = ? and micropost_id = ? and action = ? ", current_user.id, user_id, id, 'like'])
    # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_user.active_notifications.new(
        micropost_id: id,
        visited_id: user_id,
        action: 'like'
      )
      # 自分の投稿に対するいいねの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end
  
  
  # コメントの通知
  def create_notification_comment!(current_user, comment_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      micropost_id: id,
      comment_id: comment_id,
      visited_id: user_id,
      action: 'comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end

  # お気に入り機能の通知
  def create_notification_bookmark!(current_user)
    # すでに「いいね」されているか検索
    temp = Notification.where(["visitor_id = ? and visited_id = ? and micropost_id = ? and action = ? ", current_user.id, user_id, id, 'bookmark'])
    # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_user.active_notifications.new(
        micropost_id: id,
        visited_id: user_id,
        action: 'bookmark'
      )
      # 自分の投稿に対するいいねの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end


end
