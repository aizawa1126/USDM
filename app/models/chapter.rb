class Chapter < ApplicationRecord
  belongs_to :specification
  has_many :sections, dependent: :destroy

  validates :number,
             presence: true,
             numericality: {
               only_integer: true,
               greater_than: 0
             },
             uniqueness: {:scope => :specification_id}

  validates :name,
             presence: true,
             uniqueness: {:scope => :specification_id}

  validates :prefix,
             presence: true,
             uniqueness: {:scope => :specification_id}
end
