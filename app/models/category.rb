class Category < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name, message: "has already been taken"
  has_many :services
end
