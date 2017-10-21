class Member < ApplicationRecord
  belongs_to :user
  belongs_to :specification
  has_many :member_roles, dependent: :destroy
  has_many :roles, through: :member_roles

  validates :user_id,
             presence: true,
             uniqueness: {:scope => :specification_id}
end
