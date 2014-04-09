class User < ActiveRecord::Base
  attr_accessible :username, :name, :password, :password_confirmation, :rol

  attr_accessor :password
  before_save :prepare_password
  validates :username, presence: {:message => "Usted debe ingresar su nombre de usuario"}
  validates :name, presence: {:message => "Usted debe ingresar su nombre completo"}
  validates :username, length: {minimum: 4, maximum: 10, :message => "El nombre de usuario debe tener minimo 4 y maximo 10 caracteres"}
  validates :name, length: {minimum: 10, maximum: 45, :message => "El nombre de usuario debe tener minimo 10 y maximo 45 caracteres"}
  #validates_presence_of :username   
  #validates_length_of :username, :minimum => 6, :maximum =>45
  validates_uniqueness_of :username, :allow_blank => true
  validates :password, presence: {:message => "Usted debe ingresar una Contraseña"}
  validates :password, length: {minimum: 6, :message => "La Contraseña debe tener minimo 6 y caracteres"}
  #validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  #validates_length_of :password, :minimum => 6, :allow_blank => false

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
