class User < ActiveRecord::Base

<<<<<<< HEAD

  

  has_many :apps


=======
  has_many :apps

>>>>>>> c9c71db62280f902060ec0e2387ec4db1a05a128
  before_save :encrypt_password

  attr_accessor :password

  validates :email, email: true, if: :email
  validates :password, :confirmation => true
  validates :email, :password_confirmation, :presence => true
  validates :password, :presence => true, :on => :create
  validates :email, :uniqueness => true


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
