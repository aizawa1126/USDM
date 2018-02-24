class AddOriginalIdToFunctions < ActiveRecord::Migration[5.1]
  def change
    add_column :functions, :original_id, :integer
  end
end
