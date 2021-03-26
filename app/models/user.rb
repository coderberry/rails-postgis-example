class User < ApplicationRecord
  include Sjabloon::Consentable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :masqueradable

  has_person_name

  has_many :members
  has_many :teams, through: :members

  validates :name, presence: true
  has_many :sent_invites, class_name: 'Invite', foreign_key: 'sender_id'

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
end
