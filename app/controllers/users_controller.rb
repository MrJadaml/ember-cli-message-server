class UsersController < ApplicationController
  skip_before_filter :authenticate_request

  def index
    render json: User.all
  end

  def show
    render json: User.find(params[:id])
  end

  def create
    user = User.new(first_name: params['firstName'],
                    last_name: params['lastName'],
                    email: params['email'],
                    password: params['password'],
                    password_confirmation: params['passwordConfirmation'])
    if user.save
      render json: user, meta: { success: true, auth_token: user.generate_auth_token, user_id: user.id }
    end
  end

end
