class LaunchPad < ApplicationRecord

  validates :name, :full_name, :description, :status, :numberoflaunches, :latitude, :longitude, presence: true
  validates :id, length: { maximum: 24 }
  validates :name, uniqueness: true, length: { maximum: 50 }
  validates :full_name, uniqueness: true, length: { maximum: 100 }
  validates :description, length: { maximum: 1000 }
  validates :status, length: { maximum: 30 }
  validates :numberoflaunches, numericality: { only_integer: true }
  validates :latitude, numericality: { in: -90..90 }
  validates :longitude, numericality: { in: -180..180 }

  has_many :launches
  has_many :rockets, through: :launches

end
