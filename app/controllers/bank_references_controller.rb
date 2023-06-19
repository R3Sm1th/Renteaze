class BankReferencesController < ApplicationController
  # GET /property_applications/:property_application_id/bank_references/new
  def index
    @all = BankReference.all
    @b_ref = @all.where(property_application_id: @application)
    # raise
    # @identifications = @all.where(property_application.user.email = current
  end

  def tenant_index
    @application = PropertyApplication.find(params[:property_application_id])
    @bank_refs = BankReference.where(property_application: @application)
  end

  def new
    @application = PropertyApplication.find(params[:property_application_id])
    @bank_reference = BankReference.new
  end

  def edit
    @application = PropertyApplication.find(params[:property_application_id])
    @bank_reference = BankReference.find(params[:id])
  end
# / CODE BEFORE REPLICA

  # def create
  #   @application = PropertyApplication.find(params[:property_application_id])
  #   @bank_reference = BankReference.new(bank_reference_params)
  #   @bank_reference.property_application = @application
  #   @bank_reference.status = "Complete"

  #   if @bank_reference.save!
  #     redirect_to property_application_path(@application.id), format: :html, notice: "Bank Reference page was successfully updated."
  #     # redirect_to action: "show", parent_id: @application.id, id: @bank_reference.id
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  # / CODE AFTER REPLICA
  def create
    @application = PropertyApplication.find(params[:property_application_id])
    @bank_reference = BankReference.new(bank_reference_params)
    @bank_reference.property_application = @application

    if @bank_reference.save
      redirect_to tenant_index_property_application_bank_references_path(@application), notice: "Bank Reference page was successfully updated."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /identification/1
  # def update
  #   if @property.update(property_params)
  #     redirect_to properties_path, notice: "Property was successfully updated."
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end
  # end

  # PATCH/PUT /identification/1
  def update
    @bank_reference = BankReference.find(params[:id])
    @application = @bank_reference.property_application
    if @bank_reference.update(bank_reference_params)
      redirect_to property_application_path(@application), notice: "Bank Reference was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_bank_reference
  #   @application = PropertyApplication.find(params[:property_application_id])
  #   @property = @application.property
  # end

  def bank_reference_params
    params.require(:bank_reference).permit(:name, :surname, :issue_date, :expiration_date, :pdf)
  end
end
