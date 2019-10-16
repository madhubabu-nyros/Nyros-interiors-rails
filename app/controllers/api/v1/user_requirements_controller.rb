class Api::V1::UserRequirementsController < ApplicationController
  #Get all user_requirements 
  def index
    @user_requirements = UserRequirement.all
    render json: @user_requirements, status: :ok
  end

   # Get a user_requirement by id
  def show
    @user_requirement = UserRequirement.find(params[:id])
    render json: @user_requirement
  end

  # GET method for the new user_requirement 
  def new   
    @user_requirement = UserRequirement.new
  end   
   
  # POST method for processing user_requirement
  def create 
    @user_requirement = UserRequirement.new(user_requirement_params)
    if @user_requirement.save
      render json: @user_requirement, status: :created    
    else   
      render json: @user_requirement.errors, status: :unprocessable_entity
    end   
  end

  
  private

  # we used strong parameters for the validation of params 
  def user_requirement_params   
    params.require(:user_requirement).permit(:user_id, :room_id, :furniture, user_requirement_styles_attributes: [:image, :content], user_requirement_goals_attributes: [:content] )   
  end  

end
