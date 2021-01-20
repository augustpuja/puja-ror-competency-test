class RolesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  # before_action :set_role, only: [:show, :edit, :update, :destroy]

  def index
    @roles = Role.all
  end

  def show; end

  def new
    # @role = Role.new
  end

  def edit; end

  # POST /roles
  def create
    if @role.save
      redirect_to @role, notice: 'Role was successfully created.'
    else
      render :new
    end
  end

  def update
    if @role.update(role_params)
      redirect_to @role, notice: 'Role was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @role.destroy
    redirect_to roles_url, notice: 'Role was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_role
  #   @role = Role.find(params[:id])
  # end

  # Only allow a trusted parameter "white list" through.
  def role_params
    params.require(:role).permit(:name, :description)
  end
end
