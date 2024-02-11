class Launch < ApplicationRecord
  belongs_to :rocket
  belongs_to :launchpad

  validates :date, :name, presence: true
  validates :name, length: { maximum: 50 }
  validates :success, length: { maximum: 30 }

  has_many :assignments
  has_many :crews, through: :assignments
end
