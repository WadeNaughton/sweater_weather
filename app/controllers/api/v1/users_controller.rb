class Api::V1::UsersController < ApplicationController
  def new; end

  def create

    if params[:password] == params[:password_confirmation]
      user = User.create(user_params)
      render json: UserSerializer.new(user), status: 201
    else
      render json: { data: { message: 'Email or Password is incorrect.' } }, status: 404
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation, :auth_token)
  end
end
