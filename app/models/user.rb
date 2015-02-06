class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: true,
    format: { with: VALID_EMAIL_REGEX }

  has_secure_password

  has_many :journals, dependent: :destroy

  def set_reset_password_token
    self.reset_password_token = loop do
      token = SecureRandom.hex
      break token unless self.class.exists?(reset_password_token: token)
    end
    save!
  end
end
