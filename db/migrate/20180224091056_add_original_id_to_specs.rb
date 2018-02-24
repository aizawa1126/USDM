class AddOriginalIdToSpecs < ActiveRecord::Migration[5.1]
  def change
    add_column :specs, :original_id, :integer
  end
end
