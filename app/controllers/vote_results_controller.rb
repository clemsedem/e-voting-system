class VoteResultsController < ApplicationController
  before_action :set_vote_result, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /vote_results
  # GET /vote_results.json
  def index
    @vote_results = VoteResult.all
    @presidents = VoteResult.where(portfolio_id: 'P').paginate(:page => params[:page], :per_page => 5)
    logger.info "Presidents #{@presidents.inspect}"
    
    
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
      params.require(:vote_result).permit(:portfolio_id, :voter_id, :candidate_id, :user_id, :active_status, :del_status)
    end
end
