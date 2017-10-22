class Spec < ApplicationRecord
  belongs_to :function

  validates :number,
             presence: true,
             numericality: {
               only_integer: true,
               greater_than: 0
             },
             uniqueness: {:scope => :function_id}

  mount_uploader :picture, PictureUploader
end
