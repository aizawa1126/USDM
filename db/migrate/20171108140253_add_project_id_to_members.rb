class AddProjectIdToMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :project_id, :integer
  end
end
