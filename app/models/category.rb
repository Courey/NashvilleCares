class Category < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name, message: "This category already exists."
  has_many :services
end
