class Keyword < ApplicationRecord
  has_many :specs, through: :spec_keywords
end
