class Team < ApplicationRecord
  include Friendlyable

  has_many :members
  has_many :users, through: :members

  validates :name, presence: true

  has_many :invites
end

