class PropertyApplicationFinalizeController < ApplicationController
  def index
    @property = Property.find(params[:property_id])
    @markers = if @property.geocoded?
      [{
        lat: @property.latitude,
        lng: @property.longitude,
        # render the info popup window via partial for info window
        info_window_html: render_to_string(partial: "info_window", locals: { property: @property }) # this local is saying the view partials contains the local -> property, which is iterated in this page
      }]
    end
    # The `geocoded` scope filters only properties with coordinates
    # @markers = @properties.geocoded.map do |property|
    #   {
    #     lat: property.latitude,
    #     lng: property.longitude,
    #     # render the info popup window via partial for info window
    #     info_window_html: render_to_string(partial: "info_window", locals: { property: property }) # this local is saying the view partials contains the local -> property, which is iterated in this page
    #   }
    # end
  end
end
