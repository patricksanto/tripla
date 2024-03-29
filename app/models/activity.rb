class Activity < ApplicationRecord
  belongs_to :trip_day

  validates :name, :description, presence: true

  enum status: { pending: 0, approved: 1, rejected: 2}
end
