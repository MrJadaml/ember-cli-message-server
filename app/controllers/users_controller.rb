class UsersController < ApplicationController
  skip_before_filter :authenticate_request

  def index
    render json: User.all
  end
  
  def show
    render json: User.find(params[:id])
  end

end
