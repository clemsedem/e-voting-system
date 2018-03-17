class RegisteredVotersController < ApplicationController
  before_action :set_registered_voter, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /registered_voters
  # GET /registered_voters.json
  def index
    @registered_voters = RegisteredVoter.all.paginate(:page => params[:page], :per_page => 10)
    
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
      @per_page = params[:per_page] || RegisteredVoter.per_page || 10
      @registered_voters = RegisteredVoter.paginate( :per_page => @per_page, :page => params[:page])
   else
     perpage = 10
   end
   @per_page = params[:per_page] || RegisteredVoter.per_page || 10
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
     
     if params[:search_param] == 'voter_id'
       logger.info "the code comes to if  voter id............"
       @registered_voters = RegisteredVoter.voter_search(params[:search_value].strip).paginate(page: params[:page], per_page: params[:count]).order('created_at asc')
       
      elsif params[:search_param] == 'program_name'
        logger.info "the code comes to elsif program name............."
         @registered_voters = RegisteredVoter.program_search(params[:search_value].strip).paginate(page: params[:page], per_page: params[:count]).order('created_at asc')
         
      elsif params[:search_param] == 'session'
        logger.info "the code comes to elsif session............."
         @registered_voters = RegisteredVoter.session_search(params[:search_value].strip).paginate(page: params[:page], per_page: params[:count]).order('created_at asc')
     
     
      elsif params[:search_param] == 'level'
        logger.info "the code comes to elsif level............."
         @registered_voters = RegisteredVoter.level_search(params[:search_value].strip).paginate(page: params[:page], per_page: params[:count]).order('created_at asc')
        
     else
       logger.info "the code comes to the else...."
        @registered_voters = RegisteredVoter.paginate(page: params[:page], per_page: params[:count]).order('created_at desc')
        @search_json = []
     end
    
    elsif params[:search_param] == 'date'
       logger.info "the code comes to elsif date............."
       
       start = (params["start_date"] + " " + "0:00:00")# Time.zone.parse(params["start_date"].to_s + " " + "0:00:00").utc # params["start_date"].to_s + "0:00:00"
       ended = params["end_date"] + " " + ("23:59:59") # Time.zone.parse(params["end_date"].to_s + " " + "23:59:59").utc # params["end_date"].to_s + "23:59:59"
       @registered_voters = RegisteredVoter.search_date(start,ended).paginate(page: params[:page], per_page: params[:count]).order('created_at asc')
 
     
   end
   p "JSON ARRAY: #{@search_json}"
#     
    
    respond_to do |format|
      logger.info "what is the url calling this??: ans #{request.referer}"
      format.js
      format.html
      format.csv { send_data @registered_voters.to_csv(options = {}, page, perpage)}
      format.xls { send_data @registered_voters.to_csv(options={col_sep: "\t"}, page, perpage)}
    end
    
  end

  # GET /registered_voters/1
  # GET /registered_voters/1.json
  def show
  end

  # GET /registered_voters/new
  def new
    @registered_voter = RegisteredVoter.new
  end

  # GET /registered_voters/1/edit
  def edit
  end
  
  
  def all_voter_excel
    @registered_voter = RegisteredVoter.all.order('created_at desc')
    respond_to do |format|
      # format.json {render json: @search_json[1..10]}
      # p "JSON ARRAY: #{@search_json}"
      format.html
      format.js
      format.csv { send_data @registered_voter.to_csv }
      format.xls { send_data @registered_voter.to_csv(options={col_sep: "\t"}) }
    end
  end
  
  def enable_voter
      voter_id=params[:chosen]
      voter = RegisteredVoter.find(voter_id)
     if voter.update(:active_status => 1)
       redirect_to registered_voters_path, notice: 'Voter was successfully enabled.'
     end
  end

  def disable_voter
      voter_id=params[:chosen]    
      voter = RegisteredVoter.find(voter_id)    
     if voter.update(:active_status => 0)
       redirect_to registered_voters_path, notice: 'Voter was successfully disabled.'
     end
     
  end

  # POST /registered_voters
  # POST /registered_voters.json
  def create
   
    @registered_voter = RegisteredVoter.new(registered_voter_params)

    respond_to do |format|
      if @registered_voter.save
        format.html { redirect_to @registered_voter, notice: 'Registered voter was successfully created.' }
        format.json { render :show, status: :created, location: @registered_voter }
      else
        format.html { render :new }
        format.json { render json: @registered_voter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registered_voters/1
  # PATCH/PUT /registered_voters/1.json
  def update
    respond_to do |format|
      if @registered_voter.update(registered_voter_params)
        format.html { redirect_to @registered_voter, notice: 'Registered voter was successfully updated.' }
        format.json { render :show, status: :ok, location: @registered_voter }
      else
        format.html { render :edit }
        format.json { render json: @registered_voter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registered_voters/1
  # DELETE /registered_voters/1.json
  def destroy
    @registered_voter.destroy
    respond_to do |format|
      format.html { redirect_to registered_voters_url, notice: 'Registered voter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registered_voter
      @registered_voter = RegisteredVoter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registered_voter_params
      params.require(:registered_voter).permit(:voter_id, :surname, :other_names, :level_id, :session_id, :program_id, :gender, :vote_status, :user_id, :active_status, :del_status)
    end
end
