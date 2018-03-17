class DepartmentMastersController < ApplicationController
  before_action :set_department_master, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /department_masters
  # GET /department_masters.json
  def index
    @department_masters = DepartmentMaster.all.paginate(:page => params[:page], :per_page => 10)
    
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
      @per_page = params[:per_page] || DepartmentMaster.per_page || 10
      @department_masters = DepartmentMaster.paginate( :per_page => @per_page, :page => params[:page])
   else
     perpage = 10
   end
   @per_page = params[:per_page] || DepartmentMaster.per_page || 10
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
     
     if params[:search_param] == 'department_name'
       logger.info "the code comes to if  department name............"
       @department_masters = DepartmentMaster.department_search(params[:search_value].strip).paginate(page: params[:page], per_page: params[:count]).order('created_at asc')
       
      elsif params[:search_param] == 'faculty_name'
        logger.info "the code comes to elsif faculty name............."
         @department_masters = DepartmentMaster.faculty_search(params[:search_value].strip).paginate(page: params[:page], per_page: params[:count]).order('created_at asc')
        
     else
       logger.info "the code comes to the else...."
        @department_masters = DepartmentMaster.paginate(page: params[:page], per_page: params[:count]).order('created_at desc')
        @search_json = []
     end
    
    elsif params[:search_param] == 'date'
       logger.info "the code comes to elsif date............."
       
       start = (params["start_date"] + " " + "0:00:00")# Time.zone.parse(params["start_date"].to_s + " " + "0:00:00").utc # params["start_date"].to_s + "0:00:00"
       ended = params["end_date"] + " " + ("23:59:59") # Time.zone.parse(params["end_date"].to_s + " " + "23:59:59").utc # params["end_date"].to_s + "23:59:59"
       @department_masters = DepartmentMaster.search_date(start,ended).paginate(page: params[:page], per_page: params[:count]).order('created_at asc')
 
     
   end
   p "JSON ARRAY: #{@search_json}"
#     
    
    respond_to do |format|
      logger.info "what is the url calling this??: ans #{request.referer}"
      format.js
      format.html
      format.csv { send_data @department_masters.to_csv(options = {}, page, perpage)}
      format.xls { send_data @department_masters.to_csv(options={col_sep: "\t"}, page, perpage)}
    end
    
  end

  # GET /department_masters/1
  # GET /department_masters/1.json
  def show
  end

  # GET /department_masters/new
  def new
    @department_master = DepartmentMaster.new
  end

  # GET /department_masters/1/edit
  def edit
  end
  
  def all_department_excel
    @department_masters = DepartmentMaster.all.order('created_at desc')
    respond_to do |format|
      # format.json {render json: @search_json[1..10]}
      # p "JSON ARRAY: #{@search_json}"
      format.html
      format.js
      format.csv { send_data @department_masters.to_csv }
      format.xls { send_data @department_masters.to_csv(options={col_sep: "\t"}) }
    end
  end
  
  def enable_department
      department_id=params[:chosen]
      department = DepartmentMaster.find(department_id)
     if department.update(:active_status => 1)
       redirect_to department_masters_path, notice: 'Department was successfully enabled.'
     end
  end

  def disable_department
      department_id=params[:chosen]    
      department = DepartmentMaster.find(department_id)    
     if department.update(:active_status => 0)
       redirect_to department_masters_path, notice: 'Department was successfully disabled.'
     end
     
  end

  # POST /department_masters
  # POST /department_masters.json
  def create
    @department_master = DepartmentMaster.new(department_master_params)

    respond_to do |format|
      if @department_master.save
        format.html { redirect_to @department_master, notice: 'Department master was successfully created.' }
        format.json { render :show, status: :created, location: @department_master }
      else
        format.html { render :new }
        format.json { render json: @department_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /department_masters/1
  # PATCH/PUT /department_masters/1.json
  def update
    respond_to do |format|
      if @department_master.update(department_master_params)
        format.html { redirect_to @department_master, notice: 'Department master was successfully updated.' }
        format.json { render :show, status: :ok, location: @department_master }
      else
        format.html { render :edit }
        format.json { render json: @department_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /department_masters/1
  # DELETE /department_masters/1.json
  def destroy
    @department_master.destroy
    respond_to do |format|
      format.html { redirect_to department_masters_url, notice: 'Department master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_department_master
      @department_master = DepartmentMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def department_master_params
      params.require(:department_master).permit(:department_name, :faculty_id, :user_id, :active_status, :del_status)
    end
end
