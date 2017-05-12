class MainController < ApplicationController
  skip_before_action :authorize, only: [:index]

  def index
    if check_if_authorized
      redirect_to User.find_by_id(session[:user_id])
    end
  end

  def home

  end
end
