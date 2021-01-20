class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  # before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show; end

  def new
    # @user = User.new
  end

  def edit; end

  def create
    # @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def update
    if user_params[:password].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end

    if successfully_updated?(@user)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private

  def successfully_updated?(user)
    if needs_password?(user, user_params)
      @user.update(user_params)
    else
      @user.update_without_password(user_params)
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  # def set_user
  #   @user = User.find(params[:id])
  # end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:name, :role_id, :email, :password, :password_confirmation)
  end

  def needs_password?(_user, params)
    params[:password].present?
  end
end
