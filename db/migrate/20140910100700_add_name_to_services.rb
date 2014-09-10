class AddNameToServices < ActiveRecord::Migration
  def change
    add_column :services, :name, :string
    add_column :services, :category_id, :integer
  end
end
