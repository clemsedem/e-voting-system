class LevelMastersController < ApplicationController
  before_action :set_level_master, only: [:show, :edit, :update, :destroy]

  # GET /level_masters
  # GET /level_masters.json
  def index
    @level_masters = LevelMaster.all
  end

  # GET /level_masters/1
  # GET /level_masters/1.json
  def show
  end

  # GET /level_masters/new
  def new
    @level_master = LevelMaster.new
  end

  # GET /level_masters/1/edit
  def edit
  end

  # POST /level_masters
  # POST /level_masters.json
  def create
    @level_master = LevelMaster.new(level_master_params)

    respond_to do |format|
      if @level_master.save
        format.html { redirect_to @level_master, notice: 'Level master was successfully created.' }
        format.json { render :show, status: :created, location: @level_master }
      else
        format.html { render :new }
        format.json { render json: @level_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /level_masters/1
  # PATCH/PUT /level_masters/1.json
  def update
    respond_to do |format|
      if @level_master.update(level_master_params)
        format.html { redirect_to @level_master, notice: 'Level master was successfully updated.' }
        format.json { render :show, status: :ok, location: @level_master }
      else
        format.html { render :edit }
        format.json { render json: @level_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /level_masters/1
  # DELETE /level_masters/1.json
  def destroy
    @level_master.destroy
    respond_to do |format|
      format.html { redirect_to level_masters_url, notice: 'Level master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_level_master
      @level_master = LevelMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def level_master_params
      params.require(:level_master).permit(:level, :user_id, :active_status, :del_status)
    end
end
