class Assignment < ApplicationRecord
  belongs_to :crew
  belongs_to :launch

  validates :role, presence: true, length: { maximum: 30 }
end
