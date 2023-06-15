class IdentificationsController < ApplicationController
  before_action :set_property_application, only: %i[ index new edit create update]
  def index
    @all = Identification.all
    @id = @all.where(property_application_id: @application)
    # raise
    # @identifications = @all.where(property_application.user.email = current
  end

  def new
    @identification = Identification.new
  end

  def edit
  end

  # POST /identification
  def create
    @identification = Identification.new(identification_params)
    @identification.property_application = @application

    respond_to do |format|
      if @identification.save
        format.html { redirect_to property_application_path(@property), notice: "Identification page was successfully updated." }
        format.turbo_stream
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /identification/1
  def update
    if @property.update(property_params)
      redirect_to properties_path, notice: "Property was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_property_application
    @application = PropertyApplication.find(params[:property_application_id])
    @property = @application.property
  end

  def identification_params
    params.require(:identification).permit(:name, :issue_date, :expiration_date, :pdf)
  end
end
