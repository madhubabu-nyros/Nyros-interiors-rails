class Api::V1::StylesController < ApplicationController
  
  #Get all Styles
  def index
    @styles = Style.all
    render json: @styles, status: :ok
  end
  
end  

