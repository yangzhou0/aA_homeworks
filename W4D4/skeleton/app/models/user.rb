class User < ApplicationRecord
  after_initialize :ensure_session_token

  validates :user_name, :name, :email, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}
  validates :user_name, :password_digest, :session_token, uniqueness: true

  attr_reader :password
  def self.find_by_credentials(user_name, password)
    user = User.find_by(user_name: user_name)
    if user && user.is_password?(password)
      return user
    end
    nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  private
  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end



end
