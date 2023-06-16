class PropertyApplicationsController < ApplicationController

  def index
    @property = Property.find(params[:property_id])

    # Code below remedies issue... only shows YOUR applications not where tenant.
    if current_user == @property.user
      @property_applications = PropertyApplication.where(property: @property)
    else
      @property_applications = PropertyApplication.where(property: @property, user: current_user)
    end

    # Code below raised the error in the merge.
    # if current_user.tenant?
    #   # grab all properties they have applied to
    #   @properties = Property.where(property_applications: current_user.property_applications)
    # else
    #   # grab all properties they own
    #   @properties = Property.where(user: current_user)
    # end

    # # @filtered_applications = @property_applications.where(user: current_user)
  end

  # GET /property_applications/:id?step=identification
  def show
    @property_application = PropertyApplication.find(params[:id])
    @property = @property_application.property
    @tenant = @property_application.user
    # testing
    @all = Identification.all
    @id = @all.where(property_application_id: params[:id]).order(created_at: :desc)

    # case params[:step]
    # when 'identification'
    #   @identification = @property_application.identification || Identification.new
    # when 'bank_reference'
    #   @bank_reference = @property_application.bank_reference || BankReference.new
    # # Also need for employment_reference
    # when 'employment_reference'
    #   @employment_reference = @property_application.employment_reference || EmploymentReference.new
    # end
  end

  def my_applications
    @applications = current_user.property_applications
  end

  def destroy
    @properties_application = PropertyApplication.find(params[:id])
    @properties_application.destroy
    redirect_to my_applications_path, notice: "Application was successfully destroyed.", status: :see_other
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
    @property_application = PropertyApplication.find(params[:id])
  end

  def update
    @properties_applications = PropertyApplication.find(params[:id])
    @properties_applications.update(properties_applications_params)
    redirect_to property_application_path
  end

  def accept
    @past = "test"
    @property = Property.find(params[:property_id])
    @property_application = PropertyApplication.find(params[:id])
    @property_application.update!(status: "accepted")
    redirect_to property_application_path
  end

  def decline
    @property = Property.find(params[:property_id])
    @property_application = PropertyApplication.find(params[:id])
    @property_application.update!(status: "declined")
    redirect_to property_application_path
  end

  private

  def properties_applications_params
    params.require(:property_application).permit(:user_id)
  end
end
