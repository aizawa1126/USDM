class RemoveSpecificationIdFromMembers < ActiveRecord::Migration[5.1]
  def change
    remove_column :members, :specification_id, :integer
  end
end
