class Api::UsersController < ApplicationController
  def create
    user = User.new(
      user_name: params[:user_name],
      first_name: params[:first_name],
      last_name: params[:last_name],
      email_address: params[:email_address],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
      )
    if user.save
      render json: {message: 'User created successfully'}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end
end
