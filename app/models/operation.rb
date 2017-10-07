class Operation < ApplicationRecord
  has_many :permission
  has_many :roles, through: :permissions
end
