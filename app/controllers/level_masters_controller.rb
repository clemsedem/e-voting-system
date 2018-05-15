class LevelMastersController < ApplicationController
  before_action :set_level_master, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /level_masters
  # GET /level_masters.json
  def index
    @level_masters = LevelMaster.where(active_status: true).paginate(:page => params[:page], :per_page => 10)
    
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
      @per_page = params[:per_page] || LevelMaster.per_page || 10
      @level_masters = LevelMaster.paginate( :per_page => @per_page, :page => params[:page])
   else
     perpage = 10
   end
   @per_page = params[:per_page] || LevelMaster.per_page || 10
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
     
     if params[:search_param] == 'level'
       logger.info "the code comes to if  department name............"
       @level_masters = LevelMaster.level_search(params[:search_value].strip).paginate(page: params[:page], per_page: params[:count]).order('created_at asc')
       
      # elsif params[:search_param] == 'faculty_name'
        # logger.info "the code comes to elsif faculty name............."
         # @level_masters = LevelMaster.faculty_search(params[:search_value].strip).paginate(page: params[:page], per_page: params[:count]).order('created_at asc')
#         
     else
       logger.info "the code comes to the else...."
        @level_masters = LevelMaster.paginate(page: params[:page], per_page: params[:count]).order('created_at desc')
        @search_json = []
     end
    
    elsif params[:search_param] == 'date'
       logger.info "the code comes to elsif date............."
       
       start = (params["start_date"] + " " + "0:00:00")# Time.zone.parse(params["start_date"].to_s + " " + "0:00:00").utc # params["start_date"].to_s + "0:00:00"
       ended = params["end_date"] + " " + ("23:59:59") # Time.zone.parse(params["end_date"].to_s + " " + "23:59:59").utc # params["end_date"].to_s + "23:59:59"
       @level_masters = LevelMaster.search_date(start,ended).paginate(page: params[:page], per_page: params[:count]).order('created_at asc')
 
     
   end
   p "JSON ARRAY: #{@search_json}"
#     
    
    respond_to do |format|
      logger.info "what is the url calling this??: ans #{request.referer}"
      format.js
      format.html
      format.csv { send_data @level_masters.to_csv(options = {}, page, perpage)}
      format.xls { send_data @level_masters.to_csv(options={col_sep: "\t"}, page, perpage)}
    end
    
    
  end

  # GET /level_masters/1
  # GET /level_masters/1.json
  def show
  end

  # GET /level_masters/new
  def new
    @level_master = LevelMaster.new
  end

  # GET /level_masters/1/edit
  def edit
  end
  
  def all_session_excel
    @level_masters = LevelMaster.all.order('created_at desc')
    respond_to do |format|
      # format.json {render json: @search_json[1..10]}
      # p "JSON ARRAY: #{@search_json}"
      format.html
      format.js
      format.csv { send_data @level_masters.to_csv }
      format.xls { send_data @level_masters.to_csv(options={col_sep: "\t"}) }
    end
  end
  
  
  def enable_level
      level_id=params[:chosen]
      level = LevelMaster.find(level_id)
     if level.update(:active_status => 1)
       redirect_to level_masters_path, notice: 'Level was successfully enabled.'
     end
  end

  def disable_level
      level_id=params[:chosen]    
       level = LevelMaster.find(level_id)    
     if level.update(:active_status => 0)
       redirect_to level_masters_path, notice: 'Level was successfully disabled.'
     end
     
  end

  # POST /level_masters
  # POST /level_masters.json
  def create
    @level_master = LevelMaster.new(level_master_params)

    respond_to do |format|
      if @level_master.save
        format.html { redirect_to @level_master, notice: 'Level master was successfully created.' }
        format.json { render :show, status: :created, location: @level_master }
      else
        format.html { render :new }
        format.json { render json: @level_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /level_masters/1
  # PATCH/PUT /level_masters/1.json
  def update
    respond_to do |format|
      if @level_master.update(level_master_params)
        format.html { redirect_to @level_master, notice: 'Level master was successfully updated.' }
        format.json { render :show, status: :ok, location: @level_master }
      else
        format.html { render :edit }
        format.json { render json: @level_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /level_masters/1
  # DELETE /level_masters/1.json
  def destroy
    @level_master.destroy
    respond_to do |format|
      format.html { redirect_to level_masters_url, notice: 'Level master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_level_master
      @level_master = LevelMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def level_master_params
      params.require(:level_master).permit(:level, :user_id, :active_status, :del_status)
    end
end
