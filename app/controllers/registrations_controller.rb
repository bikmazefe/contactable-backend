class RegistrationsController < ApplicationController
  def create
    user = User.new(
      email: params["user"]["email"],
      password: params["user"]["password"],
      password: params["user"]["password_confirmation"],
    )

    if user.save
      session[:user_id] = user.id
      render json: { user: user }, status: :created
    else
      head :unprocessable_entity
    end
  end
end
