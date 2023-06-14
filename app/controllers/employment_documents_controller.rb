class EmploymentDocumentsController < ApplicationController
  before_action :set_property_application, only: %i[new create edit]

  def new
    @employment_document = EmploymentDocument.new
  end

  def create
    @employment_document = EmploymentDocument.new(employment_document_params)
    # property application id is needed for the simple form
    # save the property id to the left side
    @employment_document.property_application_id = @property_application.id

    if @employment_document.save!
      redirect_to  property_application_path(@property_application.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @employment_document = EmploymentDocument.find(params[:id])
  end

  def edit
    @employment_document = EmploymentDocument.find(params[:id])
  end


  def update
    @employment_document = employment_document.find(params[:id])
    if @employment_document.update(employment_document_params)
      redirect_to property_application_employment_document
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_property_application
    @property_application = PropertyApplication.find(params[:property_application_id])
  end

  def employment_document_params
    params.require(:employment_document).permit(:company_name, :date, :status, :property_application_id)
  end

end
