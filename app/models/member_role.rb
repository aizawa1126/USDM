class MemberRole < ApplicationRecord
  belongs_to :role
  belongs_to :member
end
