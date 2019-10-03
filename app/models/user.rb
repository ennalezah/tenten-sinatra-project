class User < ActiveRecord::Base
  validates :name, presence: { message: "Please enter your first and last name" }

  validates :email,
    presence: { message: "Please enter a valid email address (youremail@example.com)" },
    uniqueness: { case_sensitive: false, message: "Email address already exists" }

  validates :username,
    presence: { message: "Username cannot be blank" },
    uniqueness: { case_sensitive: false, message: "Username is already taken" }

  validates :password,
    presence: { message: "Password cannot be blank" },
    length: { minimum: 6, too_short: "Password must contain at least 6 characters" }

  has_secure_password

  has_many :posts  
end