class Portal::ConfigsController < ApplicationController
  before_action :set_portal_config, only: [:show, :edit, :update, :destroy, :load_users]

  # GET /portal/configs
  # GET /portal/configs.json
  def index
    @portal_configs = Portal::Config.all
  end

  # GET /portal/configs/1
  # GET /portal/configs/1.json
  def show
  end

  # GET /portal/configs/new
  def new
    @portal_config = Portal::Config.new
  end

  # GET /portal/configs/1/edit
  def edit
  end

  def load_users
    @portal_config.load_users
  end

  # POST /portal/configs
  # POST /portal/configs.json
  def create
    @portal_config = Portal::Config.new(portal_config_params)

    respond_to do |format|
      if @portal_config.save
        format.html { redirect_to @portal_config, notice: 'Config was successfully created.' }
        format.json { render :show, status: :created, location: @portal_config }
      else
        format.html { render :new }
        format.json { render json: @portal_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portal/configs/1
  # PATCH/PUT /portal/configs/1.json
  def update
    respond_to do |format|
      if @portal_config.update(portal_config_params)
        format.html { redirect_to @portal_config, notice: 'Config was successfully updated.' }
        format.json { render :show, status: :ok, location: @portal_config }
      else
        format.html { render :edit }
        format.json { render json: @portal_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portal/configs/1
  # DELETE /portal/configs/1.json
  def destroy
    @portal_config.destroy
    respond_to do |format|
      format.html { redirect_to portal_configs_url, notice: 'Config was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portal_config
      @portal_config = Portal::Config.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portal_config_params
      params.require(:portal_config).permit(:end_point, :username, :password, :info, :version)
    end
end
