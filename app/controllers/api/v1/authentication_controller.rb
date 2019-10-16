class Api::V1::AuthenticationController < ApplicationController
  # skip_before_action :authenticate_request
  # before_action :authenticate_request
  
  #Create token
  def create
    command = AuthenticateUser.call(params[:email], params[:password])
    if command.success?
      @user = User.find_by_email(params[:email])
      if @user.update_attribute(:authentication_token, command.result)
        render json: @user
      end   
    else
      render json: { message: command.errors }, status: :unauthorized
    end
  end


  #Update token
  def update   
    @user = User.find(params[:id])
    if @user.update_attributes(:authentication_token => nil)   
      render json: "success"
    else     
      render json: @user.errors, status: :unprocessable_entity   
    end   
  end
end