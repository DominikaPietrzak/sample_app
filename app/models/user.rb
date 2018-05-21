class User < ApplicationRecord

  attr_accessor :remember_token

  before_save { email.downcase!}
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /[A-Z0-9._%+-]+@(?:[A-Z0-9-]+\.)+[A-Z]{2,}/i
  validates :email, presence: true, length: { maximum: 255},
  format: {with: VALID_EMAIL_REGEX },
  uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  #return random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digset, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digset.nil?
      BCrypt::Password.new(remember_digset).is_password?(remember_token)
  end

  def forget
    #dlaczego symbol został tutaj użyty ?
    update_attribute(:remember_digset, nil)
  end

end
