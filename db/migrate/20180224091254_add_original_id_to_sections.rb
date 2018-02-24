class AddOriginalIdToSections < ActiveRecord::Migration[5.1]
  def change
    add_column :sections, :original_id, :integer
  end
end
