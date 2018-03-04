class FacultyMastersController < ApplicationController
  before_action :set_faculty_master, only: [:show, :edit, :update, :destroy]

  # GET /faculty_masters
  # GET /faculty_masters.json
  def index
    @faculty_masters = FacultyMaster.all.paginate(:page => params[:page], :per_page => 10)
    
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
      @per_page = params[:per_page] || FacultyMaster.per_page || 10
      @faculty_masters = FacultyMaster.paginate( :per_page => @per_page, :page => params[:page])
   else
     perpage = 10
   end
   @per_page = params[:per_page] || FacultyMaster.per_page || 10
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
     
     if params[:search_param] == 'faculty_name'
       logger.info "the code comes to if  faculty name............"
       @faculty_masters = FacultyMaster.faculty_search(params[:search_value].strip).paginate(page: params[:page], per_page: params[:count]).order('created_at asc')
#        
      # elsif params[:search_param] == 'lastname'
        # logger.info "the code comes to elsif lastname............."
        # @faculty_masters@contacts = FacultyMaster.lastname_search(params[:search_value].strip).paginate(page: params[:page], per_page: params[:count]).order('created_at asc')
        
   else
     logger.info "the code comes to the else...."
      @faculty_masters = FacultyMaster.paginate(page: params[:page], per_page: params[:count]).order('created_at desc')
      @search_json = []
     end
    
    elsif params[:search_param] == 'date'
       logger.info "the code comes to elsif date............."
       
       start = (params["start_date"] + " " + "0:00:00")# Time.zone.parse(params["start_date"].to_s + " " + "0:00:00").utc # params["start_date"].to_s + "0:00:00"
       ended = params["end_date"] + " " + ("23:59:59") # Time.zone.parse(params["end_date"].to_s + " " + "23:59:59").utc # params["end_date"].to_s + "23:59:59"
       @faculty_masters = FacultyMaster.search_date(start,ended).paginate(page: params[:page], per_page: params[:count]).order('created_at asc')
 
     
   end
   p "JSON ARRAY: #{@search_json}"
#     
    
    respond_to do |format|
      logger.info "what is the url calling this??: ans #{request.referer}"
      format.js
      format.html
      format.csv { send_data @faculty_masters.to_csv(options = {}, page, perpage)}
      format.xls { send_data @faculty_masters.to_csv(options={col_sep: "\t"}, page, perpage)}
    end
    
  end

  # GET /faculty_masters/1
  # GET /faculty_masters/1.json
  def show
  end

  # GET /faculty_masters/new
  def new
    @faculty_master = FacultyMaster.new
  end

  # GET /faculty_masters/1/edit
  def edit
  end
  
  def all_faculty_excel
    @faculty_masters = FacultyMaster.all.order('created_at desc')
    respond_to do |format|
      # format.json {render json: @search_json[1..10]}
      # p "JSON ARRAY: #{@search_json}"
      format.html
      format.js
      format.csv { send_data @faculty_masters.to_csv }
      format.xls { send_data @faculty_masters.to_csv(options={col_sep: "\t"}) }
    end
  end
  
  
  def enable_faculty
      faculty_id=params[:chosen]
      faculty = FacultyMaster.find(faculty_id)
     if faculty.update(:active_status => 1)
       redirect_to faculty_masters_path, notice: 'Faculty was successfully enabled.'
     end
  end

  def disable_faculty
      faculty_id=params[:chosen]    
      faculty = FacultyMaster.find(faculty_id)    
     if faculty.update(:active_status => 0)
       redirect_to faculty_masters_path, notice: 'Faculty was successfully disabled.'
     end
     
  end
  
  

  # POST /faculty_masters
  # POST /faculty_masters.json
  def create
    @faculty_master = FacultyMaster.new(faculty_master_params)

    respond_to do |format|
      if @faculty_master.save
        format.html { redirect_to @faculty_master, notice: 'Faculty master was successfully created.' }
        format.json { render :show, status: :created, location: @faculty_master }
      else
        format.html { render :new }
        format.json { render json: @faculty_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /faculty_masters/1
  # PATCH/PUT /faculty_masters/1.json
  def update
    respond_to do |format|
      if @faculty_master.update(faculty_master_params)
        format.html { redirect_to @faculty_master, notice: 'Faculty master was successfully updated.' }
        format.json { render :show, status: :ok, location: @faculty_master }
      else
        format.html { render :edit }
        format.json { render json: @faculty_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faculty_masters/1
  # DELETE /faculty_masters/1.json
  def destroy
    @faculty_master.destroy
    respond_to do |format|
      format.html { redirect_to faculty_masters_url, notice: 'Faculty master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_faculty_master
      @faculty_master = FacultyMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def faculty_master_params
      params.require(:faculty_master).permit(:faculty_name, :user_id, :active_status, :del_status)
    end
end
