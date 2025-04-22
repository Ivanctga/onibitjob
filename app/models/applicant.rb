class Applicant < ApplicationRecord
  belongs_to :vacancy

  validates :name, presence: true
end
