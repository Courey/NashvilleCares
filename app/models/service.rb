class Service < ActiveRecord::Base
  belongs_to :category
  validates_presence_of :category_id, :name
  validates_uniqueness_of :name, message: "This service already exists."
end
