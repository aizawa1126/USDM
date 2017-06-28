class Requirement < ApplicationRecord
  belongs_to :section
  has_many :functions, dependent: :destroy
end
