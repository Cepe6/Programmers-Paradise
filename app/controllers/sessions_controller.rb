class SessionsController < ApplicationController
  skip_before_action :authorize

  # GET /login
  def new
    @header_picture = 'account.png'
  end

  # POST /login
  def create
    @header_picture = 'account.png'

    user = User.find_by(username: params[:username])
    if user && user.password_digest == params[:password_digest]
      session[:user_id] = user.id
      redirect_to user
    else
      redirect_to '/login', alert:'Invalid username or password!'
    end
  end

  # GET /logout
  def destroy
    User.find_by(id: session[:user_id]).active = false
    session[:user_id] = nil
    redirect_to '/login', alert:'You have successfully logged out!'
  end
end
