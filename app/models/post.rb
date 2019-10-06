class Post < ActiveRecord::Base
  belongs_to :user
  
  validates :title, presence: { message: "Title cannot be left blank." }

  validates :description, presence: { message: "Description cannot be left blank." }

  validates :url, presence: { message: "Link cannot be left blank." }
end