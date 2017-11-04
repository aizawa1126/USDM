class Sheet < ApplicationRecord
  belongs_to :chapter
  has_many :sheet_pictures
end
