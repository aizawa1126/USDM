class Function < ApplicationRecord
  belongs_to :requirement
  has_many :specs, dependent: :destroy

  validates :name,
             presence: true,
             uniqueness: {:scope => :requirement_id}
end
