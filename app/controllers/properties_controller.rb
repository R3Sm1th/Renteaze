class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update destroy]

  # GET /properties
  def index
    @properties = Property.where(user: current_user)
  end

  # GET /properties/1
  def show
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties
  def create
    @property = Property.new(property_params)
    @property.user = current_user

    if @property.save
      redirect_to properties_path, notice: "Property was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /properties/1
  def update
    if @property.update(property_params)
      redirect_to properties_path, notice: "Property was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /properties/1
  def destroy
    @property.destroy
    redirect_to properties_path, notice: "Property was successfully destroyed.", status: :see_other
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_property
    @property = Property.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def property_params
    params.require(:property).permit(:number, :street, :town, :postcode, :price_per_month, :availability_date, :photo)
  end
end
