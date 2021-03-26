module SignupHelper
  def has_invite_token?
    invite_token && valid_token?
  end

  def invited_to_team
    invite.team
  end

  def invited_email
    invite.email
  end

  private

  def invite
    return if invalid_token?

    Invite.find_by(token: invite_token)
  end

  def valid_token?
    Invite.exists? token: invite_token
  end

  def invalid_token?
    !valid_token?
  end

  def invite_token
    params[:invite_token]
  end
end

