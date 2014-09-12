class AddLatitudeAndLongitudeToServiceModel < ActiveRecord::Migration
  add_column :services, :latitude, :float
  add_column :services, :longitude, :float
end
