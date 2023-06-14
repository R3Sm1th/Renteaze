class BankReferencesController < ApplicationController
  # GET /property_applications/:property_application_id/bank_references/new
  def new
    @application = PropertyApplication.find(params[:property_application_id])
    @bank_reference = BankReference.new
  end

  def edit
    @bank_references = BankReference.find(params[:id])
  end

  def create
    @bank_reference = BankReference.new(bank_reference_params)
    @bank_reference.property_application = @application

    if @bank_reference.save
      redirect_to property_property_applications_path(@property), notice: "Bank Reference page was successfully updated."
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
  def set_bank_reference
    @application = PropertyApplication.find(params[:property_application_id])
    @property = @application.property
  end

  def bank_reference_params
    params.require(:bank_reference).permit(:name, :surname, :issue_date, :expiration_date, :pdf)
  end
end
