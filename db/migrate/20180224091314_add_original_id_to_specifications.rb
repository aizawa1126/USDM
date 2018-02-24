class AddOriginalIdToSpecifications < ActiveRecord::Migration[5.1]
  def change
    add_column :specifications, :original_id, :integer
  end
end
