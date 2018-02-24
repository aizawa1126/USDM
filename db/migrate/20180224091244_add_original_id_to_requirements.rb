class AddOriginalIdToRequirements < ActiveRecord::Migration[5.1]
  def change
    add_column :requirements, :original_id, :integer
  end
end
