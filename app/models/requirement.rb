class Requirement < ApplicationRecord
  belongs_to :section
  has_many :functions, dependent: :destroy

  validates :number,
             presence: true,
             numericality: {
               only_integer: true,
               greater_than: 0
             },
             uniqueness: {:scope => :section_id}
end
