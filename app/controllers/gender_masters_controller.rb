class GenderMastersController < ApplicationController
  before_action :set_gender_master, only: [:show, :edit, :update, :destroy]

  # GET /gender_masters
  # GET /gender_masters.json
  def index
    @gender_masters = GenderMaster.all
  end

  # GET /gender_masters/1
  # GET /gender_masters/1.json
  def show
  end

  # GET /gender_masters/new
  def new
    @gender_master = GenderMaster.new
  end

  # GET /gender_masters/1/edit
  def edit
  end

  # POST /gender_masters
  # POST /gender_masters.json
  def create
    @gender_master = GenderMaster.new(gender_master_params)

    respond_to do |format|
      if @gender_master.save
        format.html { redirect_to @gender_master, notice: 'Gender master was successfully created.' }
        format.json { render :show, status: :created, location: @gender_master }
      else
        format.html { render :new }
        format.json { render json: @gender_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gender_masters/1
  # PATCH/PUT /gender_masters/1.json
  def update
    respond_to do |format|
      if @gender_master.update(gender_master_params)
        format.html { redirect_to @gender_master, notice: 'Gender master was successfully updated.' }
        format.json { render :show, status: :ok, location: @gender_master }
      else
        format.html { render :edit }
        format.json { render json: @gender_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gender_masters/1
  # DELETE /gender_masters/1.json
  def destroy
    @gender_master.destroy
    respond_to do |format|
      format.html { redirect_to gender_masters_url, notice: 'Gender master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gender_master
      @gender_master = GenderMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gender_master_params
      params.require(:gender_master).permit(:gender, :user_id, :active_status, :del_status)
    end
end
