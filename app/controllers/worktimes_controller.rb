class WorktimesController < ApplicationController
  before_action :set_worktime, only: [:show, :edit, :update, :destroy]
  before_action :require_same_user, only: [:show, :edit, :update, :destroy]
  before_action :clean_session_time, only: [:online]
  before_action :require_login_noadmin, only: [:new, :online, :offline]
  # GET /worktimes
  # GET /worktimes.json
  def index
    @worktimes = Worktime.all
  end

  # GET /worktimes/1
  # GET /worktimes/1.json
  def show
  end

  # GET /worktimes/new
  def new
    @worktime = Worktime.new
  end

  # GET /worktimes/1/edit
  def edit
  end

  # POST /worktimes
  # POST /worktimes.json
  #def create
  #  @worktime = Worktime.new(worktime_params)
  #  @worktime.user=User.find(2)
  #  respond_to do |format|
  #    if @worktime.save
  #      format.html { redirect_to @worktime, notice: 'Worktime was successfully created.' }
  #      format.json { render :show, status: :created, location: @worktime }
  #    else
  #      format.html { render :new }
  #      format.json { render json: @worktime.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # PATCH/PUT /worktimes/1
  # PATCH/PUT /worktimes/1.json
  def update
    respond_to do |format|
      if @worktime.update(worktime_params)
        format.html { redirect_to @worktime, notice: 'Worktime was successfully updated.' }
        format.json { render :show, status: :ok, location: @worktime }
      else
        format.html { render :edit }
        format.json { render json: @worktime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /worktimes/1
  # DELETE /worktimes/1.json
  def destroy
    @worktime.destroy
    respond_to do |format|
      format.html { redirect_to worktimes_url, notice: 'Worktime was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def online
    session[:online] = Time.current 
    #redirect_to new_path
    redirect_to request.referrer, notice: "online input ok"
  end

  def offline
    if  session[:online] 
     @worktime = Worktime.new
     @worktime.ontime = session[:online] 
     @worktime.offtime = Time.current   
     @worktime.user = current_user
     @worktime.save
     session[:online] = nil
     redirect_to request.referrer, notice: "offline input done"
    else
     redirect_to request.referrer, notice: "must input online first " 
    end 
      
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worktime
      begin
         @worktime = Worktime.find(params[:id])
      rescue
         flash[:danger] = "dangerous operator detected"
         redirect_to root_path
      end
    end

    # Only allow a list of trusted parameters through.
    def worktime_params
      params.require(:worktime).permit(:ontime, :offtime)
    end

    def require_same_user
      if current_user != @worktime.user and !current_user.admin? 
        flash[:danger] = "You can only edit or delete your own worktimes"
        redirect_to root_path
      end
    end

    def require_login_noadmin
      if !logged_in? or current_user.admin?
        flash[:danger] = "you can't do it"
        redirect_to root_path 
      end
    end

   def  clean_session_time
        session[:online] = nil
   end
end
