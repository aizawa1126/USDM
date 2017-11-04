class SheetPicture < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :sheet
end
