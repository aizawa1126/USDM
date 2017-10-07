class Permission < ApplicationRecord
  belongs_to :role
  belongs_to :operation
end
