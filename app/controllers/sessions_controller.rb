class SessionsController < ApplicationController
  skip_before_action :authorize

  def new
    @header_picture = 'account.png'
  end

  def create
    @header_picture = 'account.png'

    @user = User.find_by_username(params[:username])
    if @user.password_digest == params[:password_digest]
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to login_url, alert:'Invalid username or password!'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/', alert:'You have successfully logged out!'
  end
end
