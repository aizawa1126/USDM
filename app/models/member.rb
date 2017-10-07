class Member < ApplicationRecord
  belongs_to :user
  belongs_to :specification
  has_many :member_roles, dependent: :destroy
  has_many :roles, through: :member_roles
end
