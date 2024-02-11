class Assignment < ApplicationRecord
  belongs_to :crew
  belongs_to :launch

  validates :role, presence: true
  validates :role, length: { maximum: 30 }
end
