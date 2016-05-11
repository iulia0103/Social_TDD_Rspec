class Post < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  
  validates_presence_of :user, :message
end
