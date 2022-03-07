class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
        render json: UserSerializer.user_data(user)
    else
      render json: { data: { message: 'Email or Password is incorrect.' } }, status: 404
    end

  end

end
