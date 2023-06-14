class IdentificationsController < ApplicationController
  before_action :set_identification, only: %i[ new edit create update]
  def new
    @identification = Identification.new
  end

  def edit
  end

  # POST /identification
  def create
    @identification = Identification.new(identification_params)
    @identification.property_application = @application

    if @identification.save
      redirect_to property_property_applications_path(@property), notice: "Identification page was successfully updated."
    else
      render :new, status: :unprocessable_entity
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
  def set_identification
    @application = PropertyApplication.find(params[:property_application_id])
    @property = @application.property
  end

  def identification_params
    params.require(:identification).permit(:name, :issue_date, :expiration_date, :pdf)
  end
end
