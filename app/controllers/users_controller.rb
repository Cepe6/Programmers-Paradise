class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorize, only: [:new, :create]

  layout 'application'

  # GET /users
  # GET /users.json
  def index
    set_profile
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    set_profile
  end

  # GET /users/new
  def new
    @user = User.new
    set_default
  end

  # GET /users/1/edit
  def edit
    set_profile
  end

  # POST /users
  # POST /users.json
  def create
    set_default
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: 'User was successfully created'
    else
      redirect_to '/users/new', notice: @user.errors.messages.first
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    set_profile
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    set_profile
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_profile
      @user = User.find_by(id: session[:user_id])
      @profile_link = @user
      @header_picture = @user.avatar.url(:thumb)
      @profile_picture = @user.avatar.url(:medium)
    end

    def set_default
      @header_picture = 'account.png'
      @profile_link = '/users/new'
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password_digest, :password_confirmation, :avatar)
    end
end
