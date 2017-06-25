class Chapter < ApplicationRecord
  belongs_to :specification
  has_many :sections, dependent: :destroy
end
