class SessionMastersController < ApplicationController
  before_action :set_session_master, only: [:show, :edit, :update, :destroy]

  # GET /session_masters
  # GET /session_masters.json
  def index
    @session_masters = SessionMaster.all
  end

  # GET /session_masters/1
  # GET /session_masters/1.json
  def show
  end

  # GET /session_masters/new
  def new
    @session_master = SessionMaster.new
  end

  # GET /session_masters/1/edit
  def edit
  end

  # POST /session_masters
  # POST /session_masters.json
  def create
    @session_master = SessionMaster.new(session_master_params)

    respond_to do |format|
      if @session_master.save
        format.html { redirect_to @session_master, notice: 'Session master was successfully created.' }
        format.json { render :show, status: :created, location: @session_master }
      else
        format.html { render :new }
        format.json { render json: @session_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /session_masters/1
  # PATCH/PUT /session_masters/1.json
  def update
    respond_to do |format|
      if @session_master.update(session_master_params)
        format.html { redirect_to @session_master, notice: 'Session master was successfully updated.' }
        format.json { render :show, status: :ok, location: @session_master }
      else
        format.html { render :edit }
        format.json { render json: @session_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /session_masters/1
  # DELETE /session_masters/1.json
  def destroy
    @session_master.destroy
    respond_to do |format|
      format.html { redirect_to session_masters_url, notice: 'Session master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session_master
      @session_master = SessionMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_master_params
      params.require(:session_master).permit(:session, :user_id, :active_status, :del_status)
    end
end
