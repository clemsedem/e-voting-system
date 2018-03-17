class UsersController < ApplicationController
   before_action :set_user, only: [:show, :edit, :update, :destroy]
   before_action :authenticate_user!
   # load_and_authorize_resource
   # before_filter :load_permissions
   
  # GET /users
  # GET /users.json
  def index
    @users = User.all.paginate(page: params[:page], per_page: 10)

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
      @per_page = params[:per_page] || User.per_page || 10
      @users = User.paginate( :per_page => @per_page, :page => params[:page])
   else
     perpage = 10
   end
   @per_page = params[:per_page] || User.per_page || 10
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
     
     if params[:search_param] == 'username'
       logger.info "the code comes to if  username............"
       @users = User.username_search(params[:search_value].strip).paginate(page: params[:page], per_page: params[:count]).order('created_at asc')
       
      elsif params[:search_param] == 'role'
        logger.info "the code comes to elsif role............."
         @users = User.role_search(params[:search_value].strip).paginate(page: params[:page], per_page: params[:count]).order('created_at asc')
        
     else
       logger.info "the code comes to the else...."
        @users = User.paginate(page: params[:page], per_page: params[:count]).order('created_at desc')
        @search_json = []
     end
    
    elsif params[:search_param] == 'date'
       logger.info "the code comes to elsif date............."
       
       start = (params["start_date"] + " " + "0:00:00")# Time.zone.parse(params["start_date"].to_s + " " + "0:00:00").utc # params["start_date"].to_s + "0:00:00"
       ended = params["end_date"] + " " + ("23:59:59") # Time.zone.parse(params["end_date"].to_s + " " + "23:59:59").utc # params["end_date"].to_s + "23:59:59"
       @users = User.search_date(start,ended).paginate(page: params[:page], per_page: params[:count]).order('created_at asc')
 
     
   end
   p "JSON ARRAY: #{@search_json}"
#     
    
    respond_to do |format|
      logger.info "what is the url calling this??: ans #{request.referer}"
      format.js
      format.html
      format.csv { send_data @users.to_csv(options = {}, page, perpage)}
      format.xls { send_data @users.to_csv(options={col_sep: "\t"}, page, perpage)}
    end
   
  end

  # GET /users/1
  # GET /users/1.json
  def show
    
  end
  
  def all_users_excel
    @users = User.all.order('created_at desc')
    respond_to do |format|
      # format.json {render json: @search_json[1..10]}
      # p "JSON ARRAY: #{@search_json}"
      format.html
      format.js
      format.csv { send_data @users.to_csv }
      format.xls { send_data @users.to_csv(options={col_sep: "\t"}) }
    end
  end
  
  
  def enable_user
      user_id=params[:chosen]
      user = User.find(user_id)
     if user.update(:active_status => 1)
       redirect_to users_path, notice: 'User was successfully enabled.'
     end
  end

  def disable_user
      user_id=params[:chosen]    
       user = User.find(user_id)    
     if user.update(:active_status => 0)
       redirect_to users_path, notice: 'User was successfully disabled.'
     end
     
  end

  # GET /users/new
  def new
    # @roles = Role.where('status = true' )
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    # @roles = Role.where('status = true' )
  end

  # POST /users
  # POST /users.json
  def create
    # @roles = Role.where('status = true' )
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  
    

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    # @roles = Role.where('status = true' )
    
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    
    
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    # @roles = Role.where('status = true' )
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  
  
 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
    
    
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :username, :surname, :other_names, :active_status, :del_status, :role_id )
    end
    
   
     
end
