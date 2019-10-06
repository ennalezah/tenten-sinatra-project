class User < ActiveRecord::Base
  has_many :posts
  has_secure_password

  validates :name,
  presence: { message: "Please enter your first and last name." },
  format: { with: /\A[a-zA-Z\s]+\z/, message: "Name can only contain letters." },
  length: { minimum: 2, message: "Name must have at least 2 characters long." }

  validates :email,
    presence: { message: "Please enter a valid email address (youremail@example.com)." },
    uniqueness: { case_sensitive: false, message: "Email address already exists." }

  validates :username,
    presence: { message: "Username cannot be left blank." },
    length: { minimum: 4, message: "Username must have at least 4 characters." },
    format: { with: /\w/, message: "Username can only contain letter, numbers, and underscores." },
    uniqueness: { case_sensitive: false, message: "Username is already taken." }

  validates :password,
    presence: { message: "Password cannot be left blank." },
    length: { in: 6..20, message: "Password must be between 6 and 20 characters." }

  def self.find_by_slug(slug)
    self.all.find {|user| user.slug == slug}
  end

  def slug
    self.username.downcase.gsub(" ", "-") 
  end

  
end