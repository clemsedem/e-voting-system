class PortfolioMastersController < ApplicationController
  before_action :set_portfolio_master, only: [:show, :edit, :update, :destroy]

  # GET /portfolio_masters
  # GET /portfolio_masters.json
  def index
    @portfolio_masters = PortfolioMaster.all
  end

  # GET /portfolio_masters/1
  # GET /portfolio_masters/1.json
  def show
  end

  # GET /portfolio_masters/new
  def new
    @portfolio_master = PortfolioMaster.new
  end

  # GET /portfolio_masters/1/edit
  def edit
  end

  # POST /portfolio_masters
  # POST /portfolio_masters.json
  def create
    @portfolio_master = PortfolioMaster.new(portfolio_master_params)

    respond_to do |format|
      if @portfolio_master.save
        format.html { redirect_to @portfolio_master, notice: 'Portfolio master was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio_master }
      else
        format.html { render :new }
        format.json { render json: @portfolio_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portfolio_masters/1
  # PATCH/PUT /portfolio_masters/1.json
  def update
    respond_to do |format|
      if @portfolio_master.update(portfolio_master_params)
        format.html { redirect_to @portfolio_master, notice: 'Portfolio master was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio_master }
      else
        format.html { render :edit }
        format.json { render json: @portfolio_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolio_masters/1
  # DELETE /portfolio_masters/1.json
  def destroy
    @portfolio_master.destroy
    respond_to do |format|
      format.html { redirect_to portfolio_masters_url, notice: 'Portfolio master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio_master
      @portfolio_master = PortfolioMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portfolio_master_params
      params.require(:portfolio_master).permit(:ref_id, :portfolio, :user_id, :active_status, :del_status)
    end
end
