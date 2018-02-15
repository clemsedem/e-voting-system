class VoterTokensController < ApplicationController
  before_action :set_voter_token, only: [:show, :edit, :update, :destroy]

  # GET /voter_tokens
  # GET /voter_tokens.json
  def index
    @voter_tokens = VoterToken.all
  end

  # GET /voter_tokens/1
  # GET /voter_tokens/1.json
  def show
  end

  # GET /voter_tokens/new
  def new
    @voter_token = VoterToken.new
  end

  # GET /voter_tokens/1/edit
  def edit
  end

  # POST /voter_tokens
  # POST /voter_tokens.json
  def create
    @voter_token = VoterToken.new(voter_token_params)

    respond_to do |format|
      if @voter_token.save
        format.html { redirect_to @voter_token, notice: 'Voter token was successfully created.' }
        format.json { render :show, status: :created, location: @voter_token }
      else
        format.html { render :new }
        format.json { render json: @voter_token.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /voter_tokens/1
  # PATCH/PUT /voter_tokens/1.json
  def update
    respond_to do |format|
      if @voter_token.update(voter_token_params)
        format.html { redirect_to @voter_token, notice: 'Voter token was successfully updated.' }
        format.json { render :show, status: :ok, location: @voter_token }
      else
        format.html { render :edit }
        format.json { render json: @voter_token.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /voter_tokens/1
  # DELETE /voter_tokens/1.json
  def destroy
    @voter_token.destroy
    respond_to do |format|
      format.html { redirect_to voter_tokens_url, notice: 'Voter token was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_voter_token
      @voter_token = VoterToken.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def voter_token_params
      params.require(:voter_token).permit(:voter_id, :token, :user_id, :active_status, :del_status)
    end
end
