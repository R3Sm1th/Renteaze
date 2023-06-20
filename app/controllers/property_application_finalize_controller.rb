class PropertyApplicationFinalizeController < ApplicationController
  def index
    @property_application = PropertyApplication.find(params[:property_application_id])
    @markers = if @property_application.property.geocoded?
      [{
        lat: @property_application.property.latitude,
        lng: @property_application.property.longitude,
        # render the info popup window via partial for info window
        info_window_html: render_to_string(partial: "info_window", locals: { property: @property_application.property }) # this local is saying the view partials contains the local -> property, which is iterated in this page
      }]
    end
    @message = Message.new
  end

end

# you can call property_application.chatroom directly, and .messages to display the messages, property_application.chatroom.messages
