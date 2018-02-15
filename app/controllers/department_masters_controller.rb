class DepartmentMastersController < ApplicationController
  before_action :set_department_master, only: [:show, :edit, :update, :destroy]

  # GET /department_masters
  # GET /department_masters.json
  def index
    @department_masters = DepartmentMaster.all
  end

  # GET /department_masters/1
  # GET /department_masters/1.json
  def show
  end

  # GET /department_masters/new
  def new
    @department_master = DepartmentMaster.new
  end

  # GET /department_masters/1/edit
  def edit
  end

  # POST /department_masters
  # POST /department_masters.json
  def create
    @department_master = DepartmentMaster.new(department_master_params)

    respond_to do |format|
      if @department_master.save
        format.html { redirect_to @department_master, notice: 'Department master was successfully created.' }
        format.json { render :show, status: :created, location: @department_master }
      else
        format.html { render :new }
        format.json { render json: @department_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /department_masters/1
  # PATCH/PUT /department_masters/1.json
  def update
    respond_to do |format|
      if @department_master.update(department_master_params)
        format.html { redirect_to @department_master, notice: 'Department master was successfully updated.' }
        format.json { render :show, status: :ok, location: @department_master }
      else
        format.html { render :edit }
        format.json { render json: @department_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /department_masters/1
  # DELETE /department_masters/1.json
  def destroy
    @department_master.destroy
    respond_to do |format|
      format.html { redirect_to department_masters_url, notice: 'Department master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_department_master
      @department_master = DepartmentMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def department_master_params
      params.require(:department_master).permit(:department_name, :faculty_id, :user_id, :active_status, :del_status)
    end
end
