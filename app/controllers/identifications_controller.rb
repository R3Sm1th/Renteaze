require 'open-uri'

class IdentificationsController < ApplicationController
  before_action :set_property_application, only: %i[ index tenant_index new create]

  def index
    @all = Identification.all
    @id = @all.where(property_application_id: @application)
    # raise
    # @identifications = @all.where(property_application.user.email = current
  end

  def tenant_index
    @ids = Identification.where(property_application: @application)
  end

  def new
    @identification = Identification.new
  end

  # GET /identifications/:id/edit
  def edit
    @identification = Identification.find(params[:id])
  end

  # POST /identification
  def create
    @identification = Identification.new(identification_params)
    @identification.property_application = @application

    # respond_to do |format|
    if @identification.save!
      # redirect_to property_application_path(@property), notice: "Identification page was successfully updated."
      # format.turbo_stream
      redirect_to  tenant_index_property_application_identifications_path(@application), notice: "Identification document was successfully saved." # -> path to the show page for employment document
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @identification.destroy
    redirect_to properties_path, notice: "Indentification documents were successfully destroyed.", status: :see_other
  end


  # PATCH/PUT /identification/1
  def update
    @identification = Identification.find(params[:id])
    @application = @identification.property_application
    if @identification.update(identification_params)
      redirect_to property_application_path(@application), notice: "Identification was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def download_pdf
    @identification = Identification.find(params[:id])
    blob = @identification.pdf.attachment.blob
    url = Cloudinary::Utils.cloudinary_url(blob.key)

    # Send the file to the user
    data = URI.open(url)
    send_data data.read, type: blob.content_type, filename: blob.filename.to_s, disposition: 'attachment'
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
