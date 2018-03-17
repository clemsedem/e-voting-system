class CandidateMastersController < ApplicationController
  before_action :set_candidate_master, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /candidate_masters
  # GET /candidate_masters.json
  def index
    @candidate_masters = CandidateMaster.all.paginate(:page => params[:page], :per_page => 10)
    
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
      @per_page = params[:per_page] || CandidateMaster.per_page || 10
      @candidate_masters = CandidateMaster.paginate( :per_page => @per_page, :page => params[:page])
   else
     perpage = 10
   end
   @per_page = params[:per_page] || CandidateMaster.per_page || 10
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
       logger.info "the code comes to if  portfolio............"
       @candidate_masters = CandidateMaster.portfolio_search(params[:search_value].strip).paginate(page: params[:page], per_page: params[:count]).order('created_at asc')
       
      # elsif params[:search_param] == 'program_name'
        # logger.info "the code comes to elsif program name............."
         # @candidate_masters = CandidateMaster.program_search(params[:search_value].strip).paginate(page: params[:page], per_page: params[:count]).order('created_at asc')
#          
      # elsif params[:search_param] == 'session'
        # logger.info "the code comes to elsif session............."
         # @candidate_masters = CandidateMaster.session_search(params[:search_value].strip).paginate(page: params[:page], per_page: params[:count]).order('created_at asc')
#      
#      
      # elsif params[:search_param] == 'level'
        # logger.info "the code comes to elsif level............."
         # @candidate_masters = CandidateMaster.level_search(params[:search_value].strip).paginate(page: params[:page], per_page: params[:count]).order('created_at asc')
#         
     else
       logger.info "the code comes to the else...."
        @candidate_masters = CandidateMaster.paginate(page: params[:page], per_page: params[:count]).order('created_at desc')
        @search_json = []
     end
    
    elsif params[:search_param] == 'date'
       logger.info "the code comes to elsif date............."
       
       start = (params["start_date"] + " " + "0:00:00")# Time.zone.parse(params["start_date"].to_s + " " + "0:00:00").utc # params["start_date"].to_s + "0:00:00"
       ended = params["end_date"] + " " + ("23:59:59") # Time.zone.parse(params["end_date"].to_s + " " + "23:59:59").utc # params["end_date"].to_s + "23:59:59"
       @candidate_masters = CandidateMaster.search_date(start,ended).paginate(page: params[:page], per_page: params[:count]).order('created_at asc')
 
     
   end
   p "JSON ARRAY: #{@search_json}"
#     
    
    respond_to do |format|
      logger.info "what is the url calling this??: ans #{request.referer}"
      format.js
      format.html
      format.csv { send_data @candidate_masters.to_csv(options = {}, page, perpage)}
      format.xls { send_data @candidate_masters.to_csv(options={col_sep: "\t"}, page, perpage)}
    end
    
    
  end

  # GET /candidate_masters/1
  # GET /candidate_masters/1.json
  def show
  end

  # GET /candidate_masters/new
  def new
    @candidate_master = CandidateMaster.new
    
    @voters = RegisteredVoter.order(:surname).where("surname like ?", "%#{params[:voter_id]}")
   
    @the_list = @voters.map { |a|[a.surname+" "+a.other_names+" ",a.id]  } 
    
  end

  # GET /candidate_masters/1/edit
  def edit
    @voters = RegisteredVoter.order(:surname).where("surname like ?", "%#{params[:voter_id]}")
   
    @the_list = @voters.map { |a|[a.surname+" "+a.other_names+" ",a.id]  } 
  end
  
  def all_candidate_excel
    @candidate_master = CandidateMaster.all.order('created_at desc')
    respond_to do |format|
      # format.json {render json: @search_json[1..10]}
      # p "JSON ARRAY: #{@search_json}"
      format.html
      format.js
      format.csv { send_data @candidate_master.to_csv }
      format.xls { send_data @candidate_master.to_csv(options={col_sep: "\t"}) }
    end
  end
  
  def enable_candidate
      candidate_id=params[:chosen]
      candidate = CandidateMaster.find(candidate_id)
     if candidate.update(:active_status => 1)
       redirect_to candidate_masters_path, notice: 'Candidate was successfully enabled.'
     end
  end

  def disable_candidate
      candidate_id=params[:chosen]    
      candidate = CandidateMaster.find(candidate_id)    
     if candidate.update(:active_status => 0)
       redirect_to candidate_masters_path, notice: 'Candidates was successfully disabled.'
     end
     
  end




  # POST /candidate_masters
  # POST /candidate_masters.json
  def create
    @candidate_master = CandidateMaster.new(candidate_master_params)

    respond_to do |format|
      if @candidate_master.save
        format.html { redirect_to @candidate_master, notice: 'Candidate master was successfully created.' }
        format.json { render :show, status: :created, location: @candidate_master }
      else
        format.html { render :new }
        format.json { render json: @candidate_master.errors, status: :unprocessable_entity }
        @voters = RegisteredVoter.order(:surname).where("surname like ?", "%#{params[:voter_id]}")
   
        @the_list = @voters.map { |a|[a.surname+" "+a.other_names+" ",a.id]  } 
      end
    end
  end

  # PATCH/PUT /candidate_masters/1
  # PATCH/PUT /candidate_masters/1.json
  def update
    respond_to do |format|
      if @candidate_master.update(candidate_master_params)
        format.html { redirect_to @candidate_master, notice: 'Candidate master was successfully updated.' }
        format.json { render :show, status: :ok, location: @candidate_master }
      else
        format.html { render :edit }
        format.json { render json: @candidate_master.errors, status: :unprocessable_entity }
        @voters = RegisteredVoter.order(:surname).where("surname like ?", "%#{params[:voter_id]}")
   
        @the_list = @voters.map { |a|[a.surname+" "+a.other_names+" ",a.id]  } 
      end
    end
  end

  # DELETE /candidate_masters/1
  # DELETE /candidate_masters/1.json
  def destroy
    @candidate_master.destroy
    respond_to do |format|
      format.html { redirect_to candidate_masters_url, notice: 'Candidate master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidate_master
      @candidate_master = CandidateMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def candidate_master_params
      params.require(:candidate_master).permit(:voter_id, :portfolio_id, :user_id, :active_status, :del_status,  :image, :image_file_name, :image_content_type, :image_file_size, :image_updated_at  )
    end
end
