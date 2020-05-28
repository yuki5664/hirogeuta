class User < ApplicationRecord
  before_save { self.email = email.downcase}
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
             format: { with: VALID_EMAIL_REGEX },
             uniqueness: true

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
   # 渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  has_one_attached :avatar
  validate :avatar_check
  def avatar_check
    if avatar.present?
      unless avatar.content_type.in?(%(image/jpeg image/png))
        errors.add(:avatar, 'にはjpegまたはpngファイルを添付してください')
      end
    else
      unless avatar.attached?
        errors.add(:avatar, 'ファイルを添付してください')
      end
    end
  end
end
