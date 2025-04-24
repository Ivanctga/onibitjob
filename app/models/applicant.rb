class Applicant < ApplicationRecord
  belongs_to :vacancy

  validates :name, presence: true
  has_one_attached :curriculum  
end
