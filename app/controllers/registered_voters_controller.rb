class RegisteredVotersController < ApplicationController
  before_action :set_registered_voter, only: [:show, :edit, :update, :destroy]

  # GET /registered_voters
  # GET /registered_voters.json
  def index
    @registered_voters = RegisteredVoter.all
  end

  # GET /registered_voters/1
  # GET /registered_voters/1.json
  def show
  end

  # GET /registered_voters/new
  def new
    @registered_voter = RegisteredVoter.new
  end

  # GET /registered_voters/1/edit
  def edit
  end

  # POST /registered_voters
  # POST /registered_voters.json
  def create
    @registered_voter = RegisteredVoter.new(registered_voter_params)

    respond_to do |format|
      if @registered_voter.save
        format.html { redirect_to @registered_voter, notice: 'Registered voter was successfully created.' }
        format.json { render :show, status: :created, location: @registered_voter }
      else
        format.html { render :new }
        format.json { render json: @registered_voter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registered_voters/1
  # PATCH/PUT /registered_voters/1.json
  def update
    respond_to do |format|
      if @registered_voter.update(registered_voter_params)
        format.html { redirect_to @registered_voter, notice: 'Registered voter was successfully updated.' }
        format.json { render :show, status: :ok, location: @registered_voter }
      else
        format.html { render :edit }
        format.json { render json: @registered_voter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registered_voters/1
  # DELETE /registered_voters/1.json
  def destroy
    @registered_voter.destroy
    respond_to do |format|
      format.html { redirect_to registered_voters_url, notice: 'Registered voter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registered_voter
      @registered_voter = RegisteredVoter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registered_voter_params
      params.require(:registered_voter).permit(:voter_id, :surname, :other_names, :level_id, :session_id, :program_id, :gender_id, :vote_status, :user_id, :active_status, :del_status)
    end
end
