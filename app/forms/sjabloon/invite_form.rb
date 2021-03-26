class Sjabloon::InviteForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :team_id, :integer
  attribute :email, :string
  attribute :sender_id, :integer

  validates :email, presence: true

  validate :user_does_not_exists_in_team

  def save!
    ActiveRecord::Base.transaction do
      create_invite
      email_invite
      create_member
    end if valid?
  end

  private

  def create_invite
    @invite = Invite.create!(
      team_id: team_id,
      sender_id: sender_id,
      email: email,
      token: token
    )
  end

  def email_invite
    if user_exists?
      InviteMailer.existing_user_invite(@invite).deliver_now
    else
      InviteMailer.new_user_invite(@invite).deliver_now
    end
  end

  def create_member
    if user_exists?
      user = User.find_by(email: email)

      Member.create!(
        user: user,
        team_id: team_id
      )
    end
    true
  end

  def token
    token = nil

    loop do
      token = SecureRandom.
        urlsafe_base64(9).
        gsub(/-|_/,("a".."z").
        to_a[rand(26)])
      break unless Invite.where(token: token).exists?
    end

    token
  end

  def user_exists?
    User.exists? email: email
  end

  def user_does_not_exists_in_team
    if Team.find(team_id).users.exists? email: email
      errors.add :email, 'already part of your team'
    end
  end
end

