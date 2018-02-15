class ProgramMastersController < ApplicationController
  before_action :set_program_master, only: [:show, :edit, :update, :destroy]

  # GET /program_masters
  # GET /program_masters.json
  def index
    @program_masters = ProgramMaster.all
  end

  # GET /program_masters/1
  # GET /program_masters/1.json
  def show
  end

  # GET /program_masters/new
  def new
    @program_master = ProgramMaster.new
  end

  # GET /program_masters/1/edit
  def edit
  end

  # POST /program_masters
  # POST /program_masters.json
  def create
    @program_master = ProgramMaster.new(program_master_params)

    respond_to do |format|
      if @program_master.save
        format.html { redirect_to @program_master, notice: 'Program master was successfully created.' }
        format.json { render :show, status: :created, location: @program_master }
      else
        format.html { render :new }
        format.json { render json: @program_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /program_masters/1
  # PATCH/PUT /program_masters/1.json
  def update
    respond_to do |format|
      if @program_master.update(program_master_params)
        format.html { redirect_to @program_master, notice: 'Program master was successfully updated.' }
        format.json { render :show, status: :ok, location: @program_master }
      else
        format.html { render :edit }
        format.json { render json: @program_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /program_masters/1
  # DELETE /program_masters/1.json
  def destroy
    @program_master.destroy
    respond_to do |format|
      format.html { redirect_to program_masters_url, notice: 'Program master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program_master
      @program_master = ProgramMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def program_master_params
      params.require(:program_master).permit(:program_name, :department_id, :user_id, :active_status, :del_status)
    end
end
