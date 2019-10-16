class Api::V1::RoomsController < ApplicationController

  #Get all Rooms  
  def index
    @rooms = Room.all
    render json: @rooms, status: :ok
  end
end  
