class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
    @header_picture = 'account.png'
  end

  def create
    @header_picture = 'account.png'

    user = User.find_by(username: params[:username])
    if user and user.authenticate(params[:password_digest])
      @user = user
      sessions[:user_id] = user_id
      redirect_to user
    else
      redirect_to login_url, alert:'Invalid username or password!'
    end
  end

  def destroy
    sessions[:user_id] = nil
    redirect login_url, alert:'You have successfully logged out!'
  end
end
