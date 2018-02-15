class CandidateMastersController < ApplicationController
  before_action :set_candidate_master, only: [:show, :edit, :update, :destroy]

  # GET /candidate_masters
  # GET /candidate_masters.json
  def index
    @candidate_masters = CandidateMaster.all
  end

  # GET /candidate_masters/1
  # GET /candidate_masters/1.json
  def show
  end

  # GET /candidate_masters/new
  def new
    @candidate_master = CandidateMaster.new
  end

  # GET /candidate_masters/1/edit
  def edit
  end

  # POST /candidate_masters
  # POST /candidate_masters.json
  def create
    @candidate_master = CandidateMaster.new(candidate_master_params)

    respond_to do |format|
      if @candidate_master.save
        format.html { redirect_to @candidate_master, notice: 'Candidate master was successfully created.' }
        format.json { render :show, status: :created, location: @candidate_master }
      else
        format.html { render :new }
        format.json { render json: @candidate_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candidate_masters/1
  # PATCH/PUT /candidate_masters/1.json
  def update
    respond_to do |format|
      if @candidate_master.update(candidate_master_params)
        format.html { redirect_to @candidate_master, notice: 'Candidate master was successfully updated.' }
        format.json { render :show, status: :ok, location: @candidate_master }
      else
        format.html { render :edit }
        format.json { render json: @candidate_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidate_masters/1
  # DELETE /candidate_masters/1.json
  def destroy
    @candidate_master.destroy
    respond_to do |format|
      format.html { redirect_to candidate_masters_url, notice: 'Candidate master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidate_master
      @candidate_master = CandidateMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def candidate_master_params
      params.require(:candidate_master).permit(:voter_id, :portfolio_id, :user_id, :active_status, :del_status)
    end
end
