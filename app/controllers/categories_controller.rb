class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @services = @category.services
    @hash = Gmaps4rails.build_markers(@services) do |service, marker|
      marker.lat service.latitude
      marker.lng service.longitude
      marker.infowindow service.name
    end
  end
end
