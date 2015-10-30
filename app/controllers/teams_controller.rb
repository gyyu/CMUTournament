class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :require_admin

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
  end

  # GET /teams/new
  def new
    @team = Team.new
    @free_users = User.where(:team_id => nil, :user_type => nil)
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @free_users = User.where(:team_id => nil, :user_type => nil).sort_by(&:name)
    @team = Team.new(team_params)
    if (params["teammate1"].blank? || params["teammate2"].blank? ||
        params["teammate1"] == params["teammate2"])
      respond_to do |format|
        format.html { render :new }
        format.json { render json: {:error => "Must Select 2 unique users"}, status: :unprocessable_entity }
      end
    else
      teammate1 = User.find(params["teammate1"])
      teammate2 = User.find(params["teammate2"])

      respond_to do |format|
        if @team.save
          teammate1.update(:team_id => @team.id)
          teammate2.update(:team_id => @team.id)
          puts teammate1.save
          puts teammate2.save
          format.html { redirect_to @team, notice: 'Team was successfully created.' }
          format.json { render :show, status: :created, location: @team }
        else
          format.html { render :new }
          format.json { render json: @team.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      puts params
      params.require(:team).permit(:name, :school)
    end
end
