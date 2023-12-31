require 'open-uri'

class EmploymentDocumentsController < ApplicationController
  before_action :set_property_application, only: %i[index tenant_index new create]

  def index
    # @employment_documents = EmploymentDocument.all
    @all = EmploymentDocument.all
    @e_ref = @all.where(property_application_id: @property_application)
  end

  def tenant_index
    @employment_documents = EmploymentDocument.where(property_application: @property_application)
  end

  # GET /property_applications/:property_application_id/employment_documents/new
  def new
    @employment_document = EmploymentDocument.new
  end

  # POST /property_applications/:property_application_id/employment_documents
  def create
    @employment_document = EmploymentDocument.new(employment_document_params)
    # property application id is needed for the simple form
    # save the property id to the left side
    @employment_document.property_application_id = @property_application.id

    if @employment_document.save!
      # redirect_to  property_application_path(@property_application.id) -> this line path to property application

      # stuck here, cannot find the right id
      redirect_to  tenant_index_property_application_employment_documents_path(@property_application), notice: "Employment document was successfully saved." # -> path to the show page for employment document
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /employment_documents/:id
  def show
    @employment_document = EmploymentDocument.find(params[:id])
    @property_application = @employment_document.property_application
  end

  def edit
    @employment_document = EmploymentDocument.find(params[:id])
  end

  def update
    @employment_document = EmploymentDocument.find(params[:id])
    @property_application = @employment_document.property_application
    if @employment_document.update(employment_document_params)
      redirect_to property_application_path(@property_application.id), notice: "Employment document was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @employment_document = EmploymentDocument.find(params[:id])
    @property_application = @employment_document.property_application
    @employment_document.destroy
    redirect_to property_application_path(@property_application.id), notice: "Employment document was successfully destroyed.", status: :see_other
  end

  def download_pdf
    @employment_document = EmploymentDocument.find(params[:id])
    blob = @employment_document.pdf.attachment.blob
    url = Cloudinary::Utils.cloudinary_url(blob.key)

    # Send the file to the user
    data = URI.open(url)
    send_data data.read, type: blob.content_type, filename: blob.filename.to_s, disposition: 'attachment'
  end

  private

  def set_property_application
    @property_application = PropertyApplication.find(params[:property_application_id])
  end

  def employment_document_params
    params.require(:employment_document).permit(:company_name, :date, :status, :property_application_id, :pdf)
  end

end
