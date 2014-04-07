class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation, :rol

  attr_accessor :password
  before_save :prepare_password

  validates_presence_of :username
  validates_length_of :username, :minimum => 6, :maximum =>45
  validates_uniqueness_of :username, :email, :allow_blank => true
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  validates_length_of :password, :minimum => 6, :allow_blank => false

  def self.authenticate(login, pass)
    user = find_by_username(login) || find_by_email(login)
    return user if user && user.password_hash == user.encrypt_password(pass)
  end

  def encrypt_password(pass)
    BCrypt::Engine.hash_secret(pass, password_salt)
  end

  private

  def prepare_password
    unless password.blank?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = encrypt_password(password)
    end
  end
end
