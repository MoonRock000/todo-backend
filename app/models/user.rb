# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :tasks

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP,
                                                                message: 'must be a valid email address' }
  validates :name, presence: true, length: { minimum: 4, maximum: 50 }
  validates :password, length: { minimum: 8, maximum: 50 }
end
