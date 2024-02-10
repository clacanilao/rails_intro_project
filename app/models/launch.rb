class Launch < ApplicationRecord
  belongs_to :rocket
  belongs_to :launchpad

  validates :date, :outcome, presence: true

  has_many :assignments
  has_many :crews, through: :assignments
end
