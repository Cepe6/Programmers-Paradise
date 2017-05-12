class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize
  before_filter :change_acc_icon
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def change_acc_icon
    user = User.find_by_id(session[:user_id])
    if user
      @header_picture = user.avatar.url(:thumb)
    else
      @header_picture = 'account.png'
    end
  end

  protected
  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to '/login', alert: 'You thought you could gain unauthorised access? LOL'
    end
  end

  def check_if_authorized
    value = false

    if User.find_by_id(session[:user_id])
      puts "here"
      value = true
    end
    puts "herehere"
    value
  end
end
