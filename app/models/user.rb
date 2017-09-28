class User < ApplicationRecord
  has_many :members
  has_many :specifications, through: :members
end
