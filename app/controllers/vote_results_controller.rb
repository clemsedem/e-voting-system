class VoteResultsController < ApplicationController
  before_action :set_vote_result, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /vote_results
  # GET /vote_results.json
  def index
    # President
    @total_votes =  VoteResult.count(:voter_id) / 5
    @total_reg_voters  = RegisteredVoter.where(active_status: true).count(:voter_id)
    @vote_cast_for_prez = VoteResult.where('portfolio_id =? OR portfolio_id =?', 'P', 'P_NONE').count(:voter_id) 
    @total_valid_votes_for_prez = VoteResult.where(portfolio_id: 'P').count(:portfolio_id)
    @total_rejected_vote_for_prez = VoteResult.where(portfolio_id: 'P_NONE').count(:portfolio_id)
    
      @reject_per = (@total_rejected_vote_for_prez.to_f / @vote_cast_for_prez)* 100
      @reject_per_final = '%.2f' % @reject_per
      
    # Slot 1
    @results_prez1 = VoteResult.select("id, slot, candidate_id").where(portfolio_id: 'P', slot: 1)
    if @results_prez1.present?
      @count_prez1 = @results_prez1.count(:candidate_id)
    else
      @count_prez1 = 0
    end    
    @candidate1 = CandidateMaster.where(portfolio_id: 'P', slot_id: 1)[0]
    
    @prez1_per = (@count_prez1.to_f / @vote_cast_for_prez) * 100
    @prez1_per_final = '%.2f' % @prez1_per
    
    # Slot 2
    @results_prez2 = VoteResult.select("id, slot, candidate_id").where(portfolio_id: 'P', slot: 2)
    if @results_prez2.present?
      @count_prez2 = @results_prez2.count(:candidate_id)
    else
      @count_prez2 = 0
    end      
    @candidate2 = CandidateMaster.where(portfolio_id: 'P', slot_id: 2)[0]
    @prez2_per = (@count_prez2.to_f/ @vote_cast_for_prez)* 100
    @prez2_per_final = '%.2f' % @prez2_per
       
    # Slot 3
    @results_prez3 = VoteResult.select("id, slot, candidate_id").where(portfolio_id: 'P', slot: 3)
    if @results_prez3.present?
      @count_prez3 = @results_prez3.count(:candidate_id)
    else
      @count_prez3 = 0
    end 
    @candidate3 = CandidateMaster.where(portfolio_id: 'P', slot_id: 3)[0]
    @prez3_per = (@count_prez3.to_f/ @vote_cast_for_prez) * 100
    @prez3_per_final = '%.2f' % @prez3_per
   
   
  end

  # GET /vote_results/1
  # GET /vote_results/1.json
  def show
  end

  # GET /vote_results/new
  def new
    @vote_result = VoteResult.new
  end

  # GET /vote_results/1/edit
  def edit
  end

  # POST /vote_results
  # POST /vote_results.json
  def create
    @vote_result = VoteResult.new(vote_result_params)

    respond_to do |format|
      if @vote_result.save
        format.html { redirect_to @vote_result, notice: 'Vote result was successfully created.' }
        format.json { render :show, status: :created, location: @vote_result }
      else
        format.html { render :new }
        format.json { render json: @vote_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vote_results/1
  # PATCH/PUT /vote_results/1.json
  def update
    respond_to do |format|
      if @vote_result.update(vote_result_params)
        format.html { redirect_to @vote_result, notice: 'Vote result was successfully updated.' }
        format.json { render :show, status: :ok, location: @vote_result }
      else
        format.html { render :edit }
        format.json { render json: @vote_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vote_results/1
  # DELETE /vote_results/1.json
  def destroy
    @vote_result.destroy
    respond_to do |format|
      format.html { redirect_to vote_results_url, notice: 'Vote result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote_result
      @vote_result = VoteResult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_result_params
      params.require(:vote_result).permit(:portfolio_id, :voter_id, :candidate_id, :user_id, :active_status, :del_status, :slot)
    end
end
