class TeamsController < ApplicationController
  before_action :authenticate_user!, only: %w(index show new create)
  before_action :set_team_id, only: %w(show)

  def index
    @teams = current_user.teams
  end

  def show
    @team = current_team
  end

  def new
    @team = Team.new
  end

  def create
    team = Team.new(team_params)

    if team.save!
      team.members.create! user: current_user

      redirect_to teams_path, notice: "Created"
    else
      render :new
    end
  end

  private

  def set_team_id
    current_user.update!(
      team_id: Team.friendly.find(params[:id])&.id
    )
  end

  def team_params
    params.require(:team).permit(
      :name,
    )
  end
end

