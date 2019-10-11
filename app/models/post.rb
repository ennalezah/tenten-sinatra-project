class Post < ActiveRecord::Base
  belongs_to :user

  validates :category, presence: { message: "Choose the category that best describes your recommendation." }
  
  validates :location_name, presence: { message: "Location name cannot be left blank." }

  validates :description, presence: { message: "Description cannot be left blank." }

  validates :url, presence: { message: "Link cannot be left blank and must have the correct format (https://thisisanexample.com/)." }
end