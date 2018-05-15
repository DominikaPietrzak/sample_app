class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /[A-Z0-9._%+-]+@(?:[A-Z0-9-]+\.)+[A-Z]{2,}/i
  validates :email, presence: true, length: { maximum: 255},
  format: {with: VALID_EMAIL_REGEX },
  uniqueness: { case_sensitive: false }

end
