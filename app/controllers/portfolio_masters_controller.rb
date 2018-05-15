class PortfolioMastersController < ApplicationController
  before_action :set_portfolio_master, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /portfolio_masters
  # GET /portfolio_masters.json
  def index
    @portfolio_masters = PortfolioMaster.where(active_status: true).paginate(:page => params[:page], :per_page => 10)
    
     if params[:count]
      params[:count]
   else
     params[:count] = 10
   end
   
   if params[:page]
     page = params[:page].to_i
   else
     page = 1
   end
   
   if params[:per_page].present?
      # perpage = params[:per_page]
      @per_page = params[:per_page] || PortfolioMaster.per_page || 10
      @portfolio_masters = PortfolioMaster.paginate( :per_page => @per_page, :page => params[:page])
   else
     perpage = 10
   end
   @per_page = params[:per_page] || PortfolioMaster.per_page || 10
   page = if params[:page]
            params[:page].to_i
           else
            1
           end
   
   
#            
   # per_page = 5
#    
   # offset = (page - 1) * per_page
   # limit = page * per_page
   # @array = *(offset...limit)


   if  params[:search_value] && params[:search_value].strip != ''
     
     if params[:search_param] == 'portfolio'
       logger.info "the code comes to if  department name............"
       @portfolio_masters = PortfolioMaster.portfolio_search(params[:search_value].strip).paginate(page: params[:page], per_page: params[:count]).order('created_at asc')
       
      elsif params[:search_param] == 'faculty_name'
        logger.info "the code comes to elsif faculty name............."
         @portfolio_masters = PortfolioMaster.faculty_search(params[:search_value].strip).paginate(page: params[:page], per_page: params[:count]).order('created_at asc')
        
     else
       logger.info "the code comes to the else...."
        @portfolio_masters = PortfolioMaster.paginate(page: params[:page], per_page: params[:count]).order('created_at desc')
        @search_json = []
     end
    
    elsif params[:search_param] == 'date'
       logger.info "the code comes to elsif date............."
       
       start = (params["start_date"] + " " + "0:00:00")# Time.zone.parse(params["start_date"].to_s + " " + "0:00:00").utc # params["start_date"].to_s + "0:00:00"
       ended = params["end_date"] + " " + ("23:59:59") # Time.zone.parse(params["end_date"].to_s + " " + "23:59:59").utc # params["end_date"].to_s + "23:59:59"
       @portfolio_masters = PortfolioMaster.search_date(start,ended).paginate(page: params[:page], per_page: params[:count]).order('created_at asc')
 
     
   end
   p "JSON ARRAY: #{@search_json}"
#     
    
    respond_to do |format|
      logger.info "what is the url calling this??: ans #{request.referer}"
      format.js
      format.html
      format.csv { send_data @portfolio_masters.to_csv(options = {}, page, perpage)}
      format.xls { send_data @portfolio_masters.to_csv(options={col_sep: "\t"}, page, perpage)}
    end
    
    
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
  
  def all_portfolio_excel
    @portfolio_master = PortfolioMaster.all.order('created_at desc')
    respond_to do |format|
      # format.json {render json: @search_json[1..10]}
      # p "JSON ARRAY: #{@search_json}"
      format.html
      format.js
      format.csv { send_data @portfolio_master.to_csv }
      format.xls { send_data @portfolio_master.to_csv(options={col_sep: "\t"}) }
    end
  end
  
  
  def enable_portfolio
      portfolio_id=params[:chosen]
      portfolio = PortfolioMaster.find(portfolio_id)
     if portfolio.update(:active_status => 1)
       redirect_to portfolio_masters_path, notice: 'Portfolio was successfully enabled.'
     end
  end

  def disable_portfolio
      portfolio_id=params[:chosen]    
      portfolio = PortfolioMaster.find(portfolio_id)    
     if portfolio.update(:active_status => 0)
       redirect_to portfolio_masters_path, notice: 'Portfolio was successfully disabled.'
     end
     
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
