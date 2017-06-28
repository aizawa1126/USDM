class Function < ApplicationRecord
  belongs_to :requirement
  has_many :specs, dependent: :destroy
end
