class AddOriginalIdToSheetPictures < ActiveRecord::Migration[5.1]
  def change
    add_column :sheet_pictures, :original_id, :integer
  end
end
