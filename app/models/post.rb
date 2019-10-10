class Post < ActiveRecord::Base
  belongs_to :user

  validates :category,
    presence: { message: "Choose the category that best describes your recommendation." }
  
  validates :title, presence: { message: "Title cannot be left blank." }

  validates :description, presence: { message: "Description cannot be left blank." }

  validates :url, presence: { message: "Link cannot be left blank and must have the correct format (https://thisisanexample.com/)." }
end