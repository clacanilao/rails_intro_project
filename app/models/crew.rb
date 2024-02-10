class Crew < ApplicationRecord

  validates :name, :image, :status, :wikilink, presence: true
  validates :id, length: { maximum: 24 }
  validates :name, uniqueness: true, length: { maximum: 50 }
  validates :status, length: { maximum: 30 }

  has_many :assignments
  has_many :launches, through: :assignments
end
