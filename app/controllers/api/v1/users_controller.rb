class Api::V1::UsersController < ApplicationController
  
  #Get all users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # Get a user by id
  def show
     @user = User.find(params[:id])
     render json: @user
  end

  # GET method for the new user
  def new   
    @user = User.new
  end   
  
  # POST method for processing user 
  def create
    @user = User.new(user_params) 
    if @user.save
      command = AuthenticateUser.call(@user.email, @user.password)
        if @user.update_attribute(:authentication_token, command.result)
          render json: @user
        end   
      # render json: @user, status: :created    
    else   
      render json: @user.errors, status: :unprocessable_entity
    end   
  end  

  # GET method for editing a user based on id
  def edit 
    @user = User.find(params[:id]) 
    render json: @user
  end 

   # PUT method for updating in database a user based on id
  def update   
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)   
      render json: @user, status: :updated
    else     
      render json: @user.errors, status: :unprocessable_entity   
    end   
  end   
  
  # DELETE method for deleting a user from database based on id
  def destroy   
    @user = User.find(params[:id]) 
    @user.delete
  end   
   
  private

  # we used strong parameters for the validation of params
  def user_params
    params.require(:user).permit(:email, :password, user_requirements_attributes: [:room_id, :furniture, user_requirement_styles_attributes: [:image, :content], user_requirement_goals_attributes: [:content]])   
  end   
end  