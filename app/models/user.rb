class User < ActiveRecord::Base

  has_many :apps

  before_save :encrypt_password

  attr_accessor :password

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email, :password_confirmation
  validates_uniqueness_of :email


  def self.authenticate(email, password)
    user = User.find_by_email(email)
    if user && user.hashed_password == Digest::SHA256.hexdigest(password + user.salt)
      user
    else
      nil
    end
  end
  

  def encrypt_password
    if password.present?
      self.salt = Array.new(10) {rand(1024).to_s(36)}.join
      self.hashed_password = Digest::SHA256.hexdigest(password + salt)
    end
  end
end
