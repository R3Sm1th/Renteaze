class PropertyApplicationsController < ApplicationController
  def index
    @property_applications = PropertyApplication.all
    @property = Property.find(params[:property_id])
    #@ filtered_applications = @property_applications.where(property: @property)
  end

  # GET /property_applications/:id?step=identification
  def show
    @property_application = PropertyApplication.find(params[:id])
    @property = @property_application.property
    @tenant = @property_application.user
    case params[:step]
    when 'identification'
      @identification = @property_application.identification || Identification.new
    when 'bank_reference'
      @bank_reference = @property_application.bank_reference || BankReference.new
    # Also need for employment_reference
    else
      @identification = @property_application.identification || Identification.new
    end
  end

  def destroy
    @properties_applications = PropertyApplication.find(params[:id])
    @properties_applications.destroy
    redirect_to root_path, notice: "Post was successfully destroyed.", status: :see_other
  end

  def new
    @property_application = PropertyApplication.new
    @property = Property.find(params[:property_id])
  end

  def create
    @property_application = PropertyApplication.new(properties_applications_params)
    @property = Property.find(params[:property_id])
    @property_application.property = @property

    if @property_application.save
      redirect_to property_application_path(@property_application)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @properties_applications = PropertyApplication.find(params[:id])
  end

  def update
    @properties_applications = PropertyApplication.find(params[:id])
    @properties_applications.update(properties_applications_params)
    redirect_to properties_applications_path
  end

  private

  def properties_applications_params
    params.require(:property_application).permit(:user_id)
  end
end
