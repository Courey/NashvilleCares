class Service < ActiveRecord::Base
  belongs_to :category
  validates_presence_of :category_id, :name
  validates_uniqueness_of :name, message: "This service already exists."
  geocoded_by :location
  after_validation :geocode

  attr_accessor :search

  def self.search(search)
    if search
      Service.where("offered_services LIKE ?", "%#{search}%")
    else
      Service.all
    end
  end
end
