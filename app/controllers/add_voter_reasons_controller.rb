class AddVoterReasonsController < ApplicationController
  before_action :set_add_voter_reason, only: [:show, :edit, :update, :destroy]

  # GET /add_voter_reasons
  # GET /add_voter_reasons.json
  def index
    @add_voter_reasons = AddVoterReason.all
  end

  # GET /add_voter_reasons/1
  # GET /add_voter_reasons/1.json
  def show
  end

  # GET /add_voter_reasons/new
  def new
    @add_voter_reason = AddVoterReason.new
  end

  # GET /add_voter_reasons/1/edit
  def edit
  end

  # POST /add_voter_reasons
  # POST /add_voter_reasons.json
  def create
    @add_voter_reason = AddVoterReason.new(add_voter_reason_params)

    respond_to do |format|
      if @add_voter_reason.save
        format.html { redirect_to @add_voter_reason, notice: 'Add voter reason was successfully created.' }
        format.json { render :show, status: :created, location: @add_voter_reason }
      else
        format.json { render json: @add_voter_reason.errors, status: :unprocessable_entity }
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /add_voter_reasons/1
  # PATCH/PUT /add_voter_reasons/1.json
  def update
    respond_to do |format|
      if @add_voter_reason.update(add_voter_reason_params)
        format.html { redirect_to @add_voter_reason, notice: 'Add voter reason was successfully updated.' }
        format.json { render :show, status: :ok, location: @add_voter_reason }
      else
        format.html { render :edit }
        format.json { render json: @add_voter_reason.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /add_voter_reasons/1
  # DELETE /add_voter_reasons/1.json
  def destroy
    @add_voter_reason.destroy
    respond_to do |format|
      format.html { redirect_to add_voter_reasons_url, notice: 'Add voter reason was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_add_voter_reason
      @add_voter_reason = AddVoterReason.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def add_voter_reason_params
      params.require(:add_voter_reason).permit(:reason, :user_id, :voter_id)
    end
end
