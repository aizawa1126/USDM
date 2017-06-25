class Section < ApplicationRecord
  belongs_to :chapter
  has_many :requirements, dependent: :destroy
end
