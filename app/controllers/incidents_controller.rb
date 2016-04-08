class IncidentsController < ApplicationController
  before_action :set_incident, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]
  before_filter :authenticate_user!
  # before_action :require_permission, only: :edit
  caches_action :index
  caches_action :show, :layout => false

  # GET /incidents
  # GET /incidents.json
  def index
    @incidents = Incident.all_cached
    @incident = Incident.new
    expires_in 1.year, :public => true
  end

  # GET /incidents/1
  # GET /incidents/1.json
  def show
    expires_in 1.year, :public => true
  end

  # GET /incidents/new
  def new
         # expire_action :action =>  index
          @incident = current_user.incidents.build
          expires_in 1.year, :public => true
  end

  # GET /incidents/1/edit
  def edit
         expire_action :action =>  index
         expires_in 1.year, :public => true
  end

  # POST /incidents
  # POST /incidents.json
  def create
     expire_action :action =>  index
     # puts incident_params
     @incident = current_user.incidents.build(incident_params)
    respond_to do |format|
      if @incident.save
        format.html { redirect_to @incident, notice: 'Incident was successfully created.' }
        format.json { render :show, status: :created, location: @incident }
      else
        format.html { render :new }
        format.json { render json: @incident.errors, status: :unprocessable_entity }
      end
    end
        expires_in 1.year, :public => true

  end

  # PATCH/PUT /incidents/1
  # PATCH/PUT /incidents/1.json
  def update
    expire_action :action =>  index
    respond_to do |format|
      if @incident.update(incident_params)
        format.html { redirect_to @incident, notice: 'Incident was successfully updated.' }
        format.json { render :show, status: :ok, location: @incident }
      else
        format.html { render :edit }
        format.json { render json: @incident.errors, status: :unprocessable_entity }
      end
    end
        expires_in 1.year, :public => true
  end

# GET /incidents/1/edit
  def close
    expire_action :action =>  index
    @incident = Incident.find(params[:id])
  end

  def update_close
    expire_action :action =>  index
    @incident = Incident.find(params[:id])
    respond_to do |format|
      if @incident.update(incident_params)
        format.html { redirect_to @incident, notice: 'Incident was successfully closed.' }
        format.json { render :show, status: :ok, location: @incident }
      else
        format.html { render :close }
        format.json { render json: @incident.errors, status: :unprocessable_entity }
      end
    end
        expires_in 1.year, :public => true
  end

  def show_mine
     if current_user
        @incidents = current_user.incidents
     else
      redirect_to incidents_url, flash: { :error => "You are not logged in" }
    end
    expires_in 1.year, :public => true
  end


  # DELETE /incidents/1
  # DELETE /incidents/1.json
  def destroy
    expire_action :action =>  index
    @incident.destroy
    respond_to do |format|
      format.html { redirect_to incidents_url, notice: 'Incident was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incident
      @incident = Incident.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incident_params
      params.require(:incident).permit(:title, :category_id, :description, :severity, :location, :is_closed, :date_closed, :closing_comment, :media)
    end
end
