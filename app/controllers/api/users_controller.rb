class Api::UsersController < ApplicationController
  before_action :authenticate_user, except: [:create]
  def show
    @user = User.find_by(id: current_user.id)
    render 'show.json.jbuilder'
  end

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
      render 'show.json.jbuilder', status: :created
    else
      render 'errors.json.jbuilder', status: :bad_request
    end
  end

  def update
    @user = User.find_by(id: current_user.id)
    @user.user_name = params[:user_name] || @user.user_name
    @user.first_name = params[:first_name] || @user.first_name
    @user.last_name = params[:last_name] || @user.last_name
    @user.email_address = params[:email_address] || @user.email_address
    @user.password = params[:password] || @user.password
    @user.password_confirmation = params[:password_confirmation] || @user.password_confirmation
    if @user.save
      render 'show.json.jbuilder', status: :created
    else
      render 'errors.json.jbuilder', status: :bad_request
    end
  end
end
