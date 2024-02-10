class Rocket < ApplicationRecord

  validates :name, :description, :height, :mass, :variant, :costperlaunch, :successratepercent, presence: true
  validates :id, length: { maximum: 24 }
  validates :name, uniqueness: true, length: { maximum: 50 }
  validates :description, length: { maximum: 1000 }
  validates :height, :mass, :costperlaunch, numericality: { greater_than: 0 }
  validates :costperlaunch, :successratepercent, numericality: { only_integer: true }

  has_many :launches
  has_many :launch_pads, through: :launches
end
