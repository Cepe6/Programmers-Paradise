class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protected
  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to '/login', alert: 'You thought you could gain unauthorised access? LOL'
    end
  end
end
