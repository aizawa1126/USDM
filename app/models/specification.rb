class Specification < ApplicationRecord
  has_many :chapters, dependent: :destroy
end
