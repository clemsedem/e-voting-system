class ProgramMastersController < ApplicationController
  before_action :set_program_master, only: [:show, :edit, :update, :destroy]

  # GET /program_masters
  # GET /program_masters.json
  def index
    @program_masters = ProgramMaster.all.paginate(:page => params[:page], :per_page => 10)
    
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
      @per_page = params[:per_page] || ProgramMaster.per_page || 10
      @program_masters = ProgramMaster.paginate( :per_page => @per_page, :page => params[:page])
   else
     perpage = 10
   end
   @per_page = params[:per_page] || ProgramMaster.per_page || 10
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
       @program_masters = ProgramMaster.department_search(params[:search_value].strip).paginate(page: params[:page], per_page: params[:count]).order('created_at asc')
       
      elsif params[:search_param] == 'program_name'
        logger.info "the code comes to elsif program name............."
         @program_masters = ProgramMaster.program_search(params[:search_value].strip).paginate(page: params[:page], per_page: params[:count]).order('created_at asc')
        
     else
       logger.info "the code comes to the else...."
        @program_masters = ProgramMaster.paginate(page: params[:page], per_page: params[:count]).order('created_at desc')
        @search_json = []
     end
    
    elsif params[:search_param] == 'date'
       logger.info "the code comes to elsif date............."
       
       start = (params["start_date"] + " " + "0:00:00")# Time.zone.parse(params["start_date"].to_s + " " + "0:00:00").utc # params["start_date"].to_s + "0:00:00"
       ended = params["end_date"] + " " + ("23:59:59") # Time.zone.parse(params["end_date"].to_s + " " + "23:59:59").utc # params["end_date"].to_s + "23:59:59"
       @program_masters = ProgramMaster.search_date(start,ended).paginate(page: params[:page], per_page: params[:count]).order('created_at asc')
 
     
   end
   p "JSON ARRAY: #{@search_json}"
#     
    
    respond_to do |format|
      logger.info "what is the url calling this??: ans #{request.referer}"
      format.js
      format.html
      format.csv { send_data @program_masters.to_csv(options = {}, page, perpage)}
      format.xls { send_data @program_masters.to_csv(options={col_sep: "\t"}, page, perpage)}
    end
    
  end

  # GET /program_masters/1
  # GET /program_masters/1.json
  def show
  end

  # GET /program_masters/new
  def new
    @program_master = ProgramMaster.new
  end

  # GET /program_masters/1/edit
  def edit
  end
  
  def all_program_excel
    @program_master = ProgramMaster.all.order('created_at desc')
    respond_to do |format|
      # format.json {render json: @search_json[1..10]}
      # p "JSON ARRAY: #{@search_json}"
      format.html
      format.js
      format.csv { send_data @program_master.to_csv }
      format.xls { send_data @program_master.to_csv(options={col_sep: "\t"}) }
    end
  end
  
  
  def enable_program
      program_id=params[:chosen]
      program = ProgramMaster.find(program_id)
     if program.update(:active_status => 1)
       redirect_to program_masters_path, notice: 'Program was successfully enabled.'
     end
  end

  def disable_program
      program_id=params[:chosen]    
      program = ProgramMaster.find(program_id)    
     if program.update(:active_status => 0)
       redirect_to program_masters_path, notice: 'Program was successfully disabled.'
     end
     
  end

  # POST /program_masters
  # POST /program_masters.json
  def create
    @program_master = ProgramMaster.new(program_master_params)

    respond_to do |format|
      if @program_master.save
        format.html { redirect_to @program_master, notice: 'Program master was successfully created.' }
        format.json { render :show, status: :created, location: @program_master }
      else
        format.html { render :new }
        format.json { render json: @program_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /program_masters/1
  # PATCH/PUT /program_masters/1.json
  def update
    respond_to do |format|
      if @program_master.update(program_master_params)
        format.html { redirect_to @program_master, notice: 'Program master was successfully updated.' }
        format.json { render :show, status: :ok, location: @program_master }
      else
        format.html { render :edit }
        format.json { render json: @program_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /program_masters/1
  # DELETE /program_masters/1.json
  def destroy
    @program_master.destroy
    respond_to do |format|
      format.html { redirect_to program_masters_url, notice: 'Program master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program_master
      @program_master = ProgramMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def program_master_params
      params.require(:program_master).permit(:program_name, :department_id, :user_id, :active_status, :del_status)
    end
end
