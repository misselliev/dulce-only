# frozen_string_literal: true

class User < ApplicationRecord
  attr_accessor :remember_token
  before_create :assign_token
  before_save {email.downcase!}
  
  validates :name, presence:true, length: {maximum:50}
  validates :email, presence: true, uniqueness: true
  validates :password, presence:true
  has_secure_password

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def self.digest(string)
    Digest::SHA1.hexdigest(string)
  end

  def assign_token
    self.remember_token = User.new_token
    self.remember_digest = Digest::SHA1.hexdigest(remember_token)
  end

  def remember
    self.remember_token = new_token
    update_attribute(:remember_digest, Digest::SHA1.hexdigest(remember_token))
  end

end
