class SessionMastersController < ApplicationController
  before_action :set_session_master, only: [:show, :edit, :update, :destroy]

  # GET /session_masters
  # GET /session_masters.json
  def index
    @session_masters = SessionMaster.all.paginate(:page => params[:page], :per_page => 10)
    
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
      @per_page = params[:per_page] || SessionMaster.per_page || 10
      @session_masters = SessionMaster.paginate( :per_page => @per_page, :page => params[:page])
   else
     perpage = 10
   end
   @per_page = params[:per_page] || SessionMaster.per_page || 10
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
     
     if params[:search_param] == 'session'
       logger.info "the code comes to if  department name............"
       @session_masters = SessionMaster.session_search(params[:search_value].strip).paginate(page: params[:page], per_page: params[:count]).order('created_at asc')
       
      elsif params[:search_param] == 'faculty_name'
        logger.info "the code comes to elsif faculty name............."
         @session_masters = SessionMaster.faculty_search(params[:search_value].strip).paginate(page: params[:page], per_page: params[:count]).order('created_at asc')
        
     else
       logger.info "the code comes to the else...."
        @session_masters = SessionMaster.paginate(page: params[:page], per_page: params[:count]).order('created_at desc')
        @search_json = []
     end
    
    elsif params[:search_param] == 'date'
       logger.info "the code comes to elsif date............."
       
       start = (params["start_date"] + " " + "0:00:00")# Time.zone.parse(params["start_date"].to_s + " " + "0:00:00").utc # params["start_date"].to_s + "0:00:00"
       ended = params["end_date"] + " " + ("23:59:59") # Time.zone.parse(params["end_date"].to_s + " " + "23:59:59").utc # params["end_date"].to_s + "23:59:59"
       @session_masters = SessionMaster.search_date(start,ended).paginate(page: params[:page], per_page: params[:count]).order('created_at asc')
 
     
   end
   p "JSON ARRAY: #{@search_json}"
#     
    
    respond_to do |format|
      logger.info "what is the url calling this??: ans #{request.referer}"
      format.js
      format.html
      format.csv { send_data @session_masters.to_csv(options = {}, page, perpage)}
      format.xls { send_data @session_masters.to_csv(options={col_sep: "\t"}, page, perpage)}
    end
    
  end

  # GET /session_masters/1
  # GET /session_masters/1.json
  def show
  end

  # GET /session_masters/new
  def new
    @session_master = SessionMaster.new
  end

  # GET /session_masters/1/edit
  def edit
  end
  
  
  def all_session_excel
    @session_master = SessionMaster.all.order('created_at desc')
    respond_to do |format|
      # format.json {render json: @search_json[1..10]}
      # p "JSON ARRAY: #{@search_json}"
      format.html
      format.js
      format.csv { send_data @session_master.to_csv }
      format.xls { send_data @session_master.to_csv(options={col_sep: "\t"}) }
    end
  end
  
  def enable_session
      session_id=params[:chosen]
      session = SessionMaster.find(session_id)
     if session.update(:active_status => 1)
       redirect_to session_masters_path, notice: 'Session was successfully enabled.'
     end
  end

  def disable_session
      session_id=params[:chosen]    
       session = SessionMaster.find(session_id)    
     if session.update(:active_status => 0)
       redirect_to session_masters_path, notice: 'Session was successfully disabled.'
     end
     
  end

  # POST /session_masters
  # POST /session_masters.json
  def create
    @session_master = SessionMaster.new(session_master_params)

    respond_to do |format|
      if @session_master.save
        format.html { redirect_to @session_master, notice: 'Session master was successfully created.' }
        format.json { render :show, status: :created, location: @session_master }
      else
        format.html { render :new }
        format.json { render json: @session_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /session_masters/1
  # PATCH/PUT /session_masters/1.json
  def update
    respond_to do |format|
      if @session_master.update(session_master_params)
        format.html { redirect_to @session_master, notice: 'Session master was successfully updated.' }
        format.json { render :show, status: :ok, location: @session_master }
      else
        format.html { render :edit }
        format.json { render json: @session_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /session_masters/1
  # DELETE /session_masters/1.json
  def destroy
    @session_master.destroy
    respond_to do |format|
      format.html { redirect_to session_masters_url, notice: 'Session master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session_master
      @session_master = SessionMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_master_params
      params.require(:session_master).permit(:session, :user_id, :active_status, :del_status)
    end
end
