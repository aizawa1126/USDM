class Role < ApplicationRecord
  has_many :member_roles
  has_many :members, through: :member_roles
  has_many :permissions
  has_many :operations, through: :permissions
end
