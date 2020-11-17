class Api::V1::RegistrationsController < ApplicationController
  def create
    user =
      User.new(
        email: params['user']['email'],
        password: params['user']['password'],
        password_confirmation: params['user']['password_confirmation']
      )
    if user&.save
      session[:user_id] = user.id
      render json: { status: creatd, user: user }
    else
      render json: { status: 500 }
    end
  end
end
