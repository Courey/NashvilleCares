ActiveAdmin.register Service do

  actions :all
  permit_params :name, :category_id, :location, :website, :phone, :description, :offered_services

end
