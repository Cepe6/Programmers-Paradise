require 'bcrypt'
class SessionsController < ApplicationController
  include BCrypt

  skip_before_action :authorize
  def new
    @header_picture = 'account.png'
  end

  def create
    @header_picture = 'account.png'

    @user = User.find_by_username(params[:username])
    if @user.password_digest == params[:password_digest]
      #@user = user
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to login_url, alert:'Invalid username or password!'
    end
  end

  def destroy
    sessions[:user_id] = nil
    redirect login_url, alert:'You have successfully logged out!'
  end
end
