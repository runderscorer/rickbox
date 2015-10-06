class User < ActiveRecord::Base
  attr_accessor :password

  before_save :encrpyt_password

  validates :email, presence: true
  validates :password, presence: true
  validates_confirmation_of :password


  def encrpyt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, self.password_salt)
    end
  end
  
end
