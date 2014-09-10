ActiveAdmin.register Service do

  actions :all
  permit_params :name, :category_id

end
