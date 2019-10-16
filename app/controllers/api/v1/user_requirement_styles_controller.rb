class Api::V1::UserRequirementStylesController < ApplicationController
  
  def index
    @user_requirement_styles = UserRequirementStyle.all
    render json: @user_requirement_styles, status: :ok
  end

  def show
     @user_requirement_style = UserRequirementStyle.find(params[:id])
     render json: @user_requirement_style
  end

  def new   
    @user_requirement_style = UserRequirementStyle.new
  end   
   
  def create   
    @user_requirement_style = UserRequirementStyle.new(user_requirement_style_params) 
    if @user_requirement_style.save
      render json: @user_requirement_style, status: :created    
    else   
      render json: @user_requirement_style.errors, status: :unprocessable_entity
    end   
  end

  def destroy
  end
  private
  def user_requirement_style_params   
    params.require(:user_requirement_style).permit(:image, :user_requirement_id)   
  end  
end
