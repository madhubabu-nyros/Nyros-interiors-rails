class Admin::UserRequirementsController < ApplicationController
  #Get all user_requirements 
  def index
    @user_requirements = UserRequirement.paginate(:page => params[:page], :per_page => 10)
  end

  # Get a user_requirement by id
  def show
    @user_requirement = UserRequirement.find(params[:id])
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

  # GET method for editing a user_requirement based on id
  def edit 
    @user_requirement = UserRequirement.find(params[:id]) 
    render json: @user_requirement
  end 

  # PUT method for updating in database a user_requirement based on id 
  def update   
    @user_requirement = UserRequirement.find(params[:id])
    if @user_requirement.update_attributes(user_requirement_params)   
      render json: @user_requirement, status: :updated
    else     
      render json: @user_requirement.errors, status: :unprocessable_entity   
    end   
  end   

  # DELETE method for deleting a user_requirement from database based on id
  def destroy   
    @user_requirement = UserRequirement.find(params[:id]) 
    @user_requirement.delete
  end  

  private

  # we used strong parameters for the validation of params 
  def user_requirement_params   
    params.require(:user_requirement).permit(:user_id, :room_id, :furniture, user_requirement_styles_attributes: [:image, :content], user_requirement_goals_attributes: [:content] )   
  end  
end
