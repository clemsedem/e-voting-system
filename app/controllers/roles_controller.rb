class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /roles
  # GET /roles.json
  def index
    @roles = Role.where(active_status: true).paginate(:page => params[:page], :per_page => 10)
    
    
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
      @per_page = params[:per_page] || Role.per_page || 10
      @roles = Role.paginate( :per_page => @per_page, :page => params[:page])
   else
     perpage = 10
   end
   @per_page = params[:per_page] || Role.per_page || 10
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
     
     if params[:search_param] == 'name'
       logger.info "the code comes to if  role name............"
       @roles = Role.role_name_search(params[:search_value].strip).paginate(page: params[:page], per_page: params[:count]).order('created_at asc')
       
      elsif params[:search_param] == 'faculty_name'
        logger.info "the code comes to elsif faculty name............."
         @roles = Role.faculty_search(params[:search_value].strip).paginate(page: params[:page], per_page: params[:count]).order('created_at asc')
        
     else
       logger.info "the code comes to the else...."
        @roles = Role.paginate(page: params[:page], per_page: params[:count]).order('created_at desc')
        @search_json = []
     end
    
    elsif params[:search_param] == 'date'
       logger.info "the code comes to elsif date............."
       
       start = (params["start_date"] + " " + "0:00:00")# Time.zone.parse(params["start_date"].to_s + " " + "0:00:00").utc # params["start_date"].to_s + "0:00:00"
       ended = params["end_date"] + " " + ("23:59:59") # Time.zone.parse(params["end_date"].to_s + " " + "23:59:59").utc # params["end_date"].to_s + "23:59:59"
       @roles = Role.search_date(start,ended).paginate(page: params[:page], per_page: params[:count]).order('created_at asc')
 
     
   end
   p "JSON ARRAY: #{@search_json}"
#     
    
    respond_to do |format|
      logger.info "what is the url calling this??: ans #{request.referer}"
      format.js
      format.html
      format.csv { send_data @roles.to_csv(options = {}, page, perpage)}
      format.xls { send_data @roles.to_csv(options={col_sep: "\t"}, page, perpage)}
    end
    
    
  end

  # GET /roles/1
  # GET /roles/1.json
  def show
  end

  # GET /roles/new
  def new
    @role = Role.new
  end

  # GET /roles/1/edit
  def edit
  end
  
  
  def all_roles_excel
    @roles = Role.all.order('created_at desc')
    respond_to do |format|
      # format.json {render json: @search_json[1..10]}
      # p "JSON ARRAY: #{@search_json}"
      format.html
      format.js
      format.csv { send_data @roles.to_csv }
      format.xls { send_data @roles.to_csv(options={col_sep: "\t"}) }
    end
  end
  
  def enable_role
      role_id=params[:chosen]
      role = Role.find(role_id)
     if role.update(:active_status => 1)
       redirect_to roles_path, notice: 'Role was successfully enabled.'
     end
  end

  def disable_role
       role_id=params[:chosen]    
       role = Role.find(role_id)    
     if role.update(:active_status => 0)
       redirect_to roles_path, notice: 'Roles was successfully disabled.'
     end
     
  end

  # POST /roles
  # POST /roles.json
  def create
    @role = Role.new(role_params)

    respond_to do |format|
      if @role.save
        format.html { redirect_to @role, notice: 'Role was successfully created.' }
        format.json { render :show, status: :created, location: @role }
      else
        format.html { render :new }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roles/1
  # PATCH/PUT /roles/1.json
  def update
    respond_to do |format|
      if @role.update(role_params)
        format.html { redirect_to @role, notice: 'Role was successfully updated.' }
        format.json { render :show, status: :ok, location: @role }
      else
        format.html { render :edit }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @role.destroy
    respond_to do |format|
      format.html { redirect_to roles_url, notice: 'Role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role
      @role = Role.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def role_params
      params.require(:role).permit(:name, :active_status, :del_status, :user_id)
    end
end
