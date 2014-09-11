class AddColumnsToServices < ActiveRecord::Migration
  add_column :services, :location, :string
  add_column :services, :website, :string
  add_column :services, :phone, :string
  add_column :services, :description, :text
  add_column :services, :offered_services, :text
end
