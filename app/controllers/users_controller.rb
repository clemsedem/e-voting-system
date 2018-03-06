class UsersController < ApplicationController
   before_action :set_user, only: [:show, :edit, :update, :destroy]
   # load_and_authorize_resource
   # before_filter :load_permissions
   
  # GET /users
  # GET /users.json
  def index
    @users = User.all.paginate(page: params[:page], per_page: 8)

        # if params[:count]
         # params[:count]
       # else
         # params[:count] = 30
       # end
       # if params[:page]
         # page = params[:page].to_i
       # else
         # page = 1
       # end
       # if params[:per_page].present?
         # perpage = params[:per_page]
       # else
         # perpage = 100
       # end
       # @per_page = params[:per_page] || User.per_page || 30
       # page = if params[:page]
                # params[:page].to_i
              # else
                # 1
               # end
       # per_page = 30
       # offset = (page - 1) * per_page
       # limit = page * per_page
       # @array = *(offset...limit)
# 
       # if  params[:search_value] && params[:search_value].strip != ''
         # if params[:search_param] == 'username'
           # @users = User.username_search(params[:search_value].strip).paginate(page: params[:page], per_page: params[:count]).order('id asc')
          # elsif params[:search_param] == 'phone_number'
            # logger.info "We are INSIDE THE NUMBER PARAM"
            # @users = User.phone_number_search(params[:search_value].strip).paginate(page: params[:page], per_page: params[:count]).order('id asc')
         # elsif params[:search_param] == 'date'
           # start = (params["start_date"] + " " + "0:00:00")# Time.zone.parse(params["start_date"].to_s + " " + "0:00:00").utc # params["start_date"].to_s + "0:00:00"
           # ended = params["end_date"] + " " + ("23:59:59") # Time.zone.parse(params["end_date"].to_s + " " + "23:59:59").utc # params["end_date"].to_s + "23:59:59"
           # @users =User.search_date(start,ended).paginate(page: params[:page], per_page: params[:count]).order('id asc')
# 
       # else
          # @users = User.paginate(page: params[:page], per_page: params[:count]).order('id desc')
          # @search_json = []
         # end
       # end
       # p "JSON ARRAY: #{@search_json}"
# 
# 
# 
    # respond_to do |format|
     # format.html
     # format.xlsx
     # format.csv { send_data @users.to_csv}
   # end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    
  end

# enable user
  def enable_user
      user_id=params[:id]
     if User.update(user_id, :status => 1)
       redirect_to users_path, notice: 'User was successfully enabled.'
     end
  end

# disable user
  def disable_user
      user_id=params[:id]
     if User.update(user_id, :status => 0)
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
