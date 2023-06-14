class BankReferencesController < ApplicationController
  # GET /property_applications/:property_application_id/bank_references/new
  def new
    @application = PropertyApplication.find(params[:property_application_id])
    @bank_reference = BankReference.new
  end

  def edit
    @bank_references = BankReference.find(params[:id])
  end

  private

  def bank_references_params
    params.require(:bank_references).permit (:name, :surname, :issue_date, :expiration_date, :pdf)
  end

end
