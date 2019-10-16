class Api::V1::GoalsController < ApplicationController
  
  #Get all goals
  def index
    @goals = Goal.all
    render json: @goals, status: :ok
  end

end
