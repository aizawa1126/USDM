class Project < ApplicationRecord
  has_many :specifications, dependent: :destroy
  has_many :members
  has_many :users, through: :members
end
