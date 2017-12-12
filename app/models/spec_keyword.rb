class SpecKeyword < ApplicationRecord
  belongs_to :spec
  belongs_to :keyword

  validates :keyword_id, uniqueness: {:scope => :spec_id}
end
