class Launch < ApplicationRecord
  belongs_to :rocket
  belongs_to :launchpad

  validates :date, :outcome, presence: true

end
