class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  has_secure_password
  validates :email, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, length: { minimum: 4 }

  def self.authenticate_with_credentials(email, password)
    email_to_use = email.strip.downcase
    user = User.find_by_email(email_to_use)
    if user.authenticate(password)
      return user
    end
  end
end
