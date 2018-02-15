class FacultyMastersController < ApplicationController
  before_action :set_faculty_master, only: [:show, :edit, :update, :destroy]

  # GET /faculty_masters
  # GET /faculty_masters.json
  def index
    @faculty_masters = FacultyMaster.all
  end

  # GET /faculty_masters/1
  # GET /faculty_masters/1.json
  def show
  end

  # GET /faculty_masters/new
  def new
    @faculty_master = FacultyMaster.new
  end

  # GET /faculty_masters/1/edit
  def edit
  end

  # POST /faculty_masters
  # POST /faculty_masters.json
  def create
    @faculty_master = FacultyMaster.new(faculty_master_params)

    respond_to do |format|
      if @faculty_master.save
        format.html { redirect_to @faculty_master, notice: 'Faculty master was successfully created.' }
        format.json { render :show, status: :created, location: @faculty_master }
      else
        format.html { render :new }
        format.json { render json: @faculty_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /faculty_masters/1
  # PATCH/PUT /faculty_masters/1.json
  def update
    respond_to do |format|
      if @faculty_master.update(faculty_master_params)
        format.html { redirect_to @faculty_master, notice: 'Faculty master was successfully updated.' }
        format.json { render :show, status: :ok, location: @faculty_master }
      else
        format.html { render :edit }
        format.json { render json: @faculty_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faculty_masters/1
  # DELETE /faculty_masters/1.json
  def destroy
    @faculty_master.destroy
    respond_to do |format|
      format.html { redirect_to faculty_masters_url, notice: 'Faculty master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_faculty_master
      @faculty_master = FacultyMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def faculty_master_params
      params.require(:faculty_master).permit(:faculty_name, :user_id, :active_status, :del_status)
    end
end
