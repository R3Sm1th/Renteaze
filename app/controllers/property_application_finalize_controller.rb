class PropertyApplicationFinalizeController < ApplicationController
  def index
    @property = Property.all
  end
end
