class Portal::UsersController < ApplicationController
  before_action :set_portal_user, only: [:show, :edit, :update, :destroy]

  # GET /portal/users
  # GET /portal/users.json
  def index
    @filter_form = Portal::FilterForm.new(index_params)
    @portal_users = Portal::User.where(config_id: params[:config_id]).where(@filter_form.values).all
    @push_form = Portal::PushForm.new(nil)
    @push_form.config_id = params[:config_id]
  end

  def push
    Portal::PushForm.new(params.require(:push_form).permit!.to_h).submit
  end

  # GET /portal/users/1
  # GET /portal/users/1.json
  def show
  end

  # GET /portal/users/new
  def new
    @portal_user = Portal::User.new
  end

  # GET /portal/users/1/edit
  def edit
  end

  # POST /portal/users
  # POST /portal/users.json
  def create
    @portal_user = Portal::User.new(portal_user_params)

    respond_to do |format|
      if @portal_user.save
        format.html { redirect_to @portal_user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @portal_user }
      else
        format.html { render :new }
        format.json { render json: @portal_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portal/users/1
  # PATCH/PUT /portal/users/1.json
  def update
    respond_to do |format|
      if @portal_user.update(portal_user_params)
        format.html { redirect_to @portal_user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @portal_user }
      else
        format.html { render :edit }
        format.json { render json: @portal_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portal/users/1
  # DELETE /portal/users/1.json
  def destroy
    @portal_user.destroy
    respond_to do |format|
      format.html { redirect_to portal_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portal_user
      @portal_user = Portal::User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portal_user_params
      params.require(:portal_user).permit(:new, :index, :update, :destroy)
    end

    def index_params
      params.fetch(:filter_form, {}).permit(:country, :city).select { |k,v| v.present? }.to_h
    end
end
