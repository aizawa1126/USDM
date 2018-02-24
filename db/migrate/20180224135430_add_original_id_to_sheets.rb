class AddOriginalIdToSheets < ActiveRecord::Migration[5.1]
  def change
    add_column :sheets, :original_id, :integer
  end
end
