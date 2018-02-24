class AddOriginalIdToChapters < ActiveRecord::Migration[5.1]
  def change
    add_column :chapters, :original_id, :integer
  end
end
