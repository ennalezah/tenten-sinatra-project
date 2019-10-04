class User < ActiveRecord::Base
  validates :name,
  presence: { message: "Please enter your first and last name." },
  format: { with: /\A[a-zA-Z\s]+\z/, message: "Name can only contain letters." },
  length: { minimum: 2, message: "Name must have at least 2 characters long." }

  validates :email,
    presence: { message: "Please enter a valid email address (youremail@example.com)." },
    uniqueness: { case_sensitive: false, message: "Email address already exists."}

  validates :username,
    presence: { message: "Username cannot be blank" },
    length: { minimum: 4, message: "Username must have at least 4 characters." },
    format: { without: /\s/, message: "Username cannot have any spaces." },
    uniqueness: { case_sensitive: false, message: "Username is already taken." }

  validates :password,
    presence: { message: "Password cannot be blank" },
    length: { in: 6..20, message: "Password must be between 6 and 20 characters." }

  has_secure_password

  has_many :posts

  def self.find_by_slug(slug)
    self.all.find {|user| user.slug == slug}
  end

  def slug
    self.username.downcase.gsub(" ", "-") 
  end
end