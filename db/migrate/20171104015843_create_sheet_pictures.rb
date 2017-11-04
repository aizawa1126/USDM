class CreateSheetPictures < ActiveRecord::Migration[5.1]
  def change
    create_table :sheet_pictures do |t|
      t.string :picture
      t.integer :sheet_id

      t.timestamps
    end
  end
end
