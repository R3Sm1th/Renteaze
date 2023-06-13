class PropertiesApplicationsController < ApplicationController
  def index
    @properties_application = PropertyApplication.all
  end

  #   def destroy
  #     @properties_applications = PropertiesApplications.find(params[:id])
  #     @properties_applications.destroy
  #     redirect_to root_path, notice: "Post was successfully destroyed.", status: :see_other
  #   end

  #   def new
  #     @properties_applications = PropertiesApplications.new
  #     @properties_applications = PropertiesApplications.find(params[:properties_application_id])
  #   end

  #   def create
  #     @properties_applications = PropertiesApplications.new(properties_applications_params)
  #     @properties_applications.user = current_user
  #     if @properties_applications.save
  #       redirect_to properties_applications_path
  #     else
  #       render :new, status: :unprocessable_entity
  #     end
  #   end

  #   def edit
  #     @properties_applications = PropertiesApplications.find(params[:id])
  #   end

  #   def update
  #     @properties_applications = PropertiesApplications.find(params[:id])
  #     @properties_applications.update(properties_applications_params)
  #     redirect_to properties_applications_path
  #   end
end
