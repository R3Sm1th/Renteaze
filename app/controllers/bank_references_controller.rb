class BankReferencesController < ApplicationController
  def new
    @bank_reference = BankReference.new
  end

  def edit
    @bank_references = BankReference.find(params[:id])
  end
end
