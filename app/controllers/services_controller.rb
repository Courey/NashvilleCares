class ServicesController < ApplicationController
  def show
    @service = Service.find(params[:id])
    @hash = Gmaps4rails.build_markers(@service) do |service, marker|
      marker.lat service.latitude
      marker.lng service.longitude
      marker.infowindow service.name
    end
  end
end
