class InvitesController < ApplicationController
  before_action :authenticate_user!, only: %w(index show new create)

  def index
    @invites = current_team.invites.order(created_at: :desc)
    @invite  = Invite.new
  end

  def create
    @invite = Sjabloon::InviteForm.new(invite_params)

    if @invite.save!
      redirect_to team_invites_path, notice: 'Invite sent'
    else
      redirect_to team_invites_path, notice: 'Something went wrong'
    end
  end

  def destroy
    Invite.find(params[:id]).destroy!

    redirect_to team_invites_path(current_team)
  end

  private

  def invite_params
    params.require(:invite).permit(
      :email
    ).merge({
      team_id: current_team.id,
      sender_id: current_user.id
    })
  end
end

