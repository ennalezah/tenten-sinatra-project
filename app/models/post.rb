class Post < ActiveRecord::Base
  validates :title, presence: { message: "Title cannot be blank" }

  validates :description, presence: { message: "Description cannot be blank" }
  
  belongs_to :user
end