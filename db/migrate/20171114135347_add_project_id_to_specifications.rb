class AddProjectIdToSpecifications < ActiveRecord::Migration[5.1]
  def change
    add_column :specifications, :project_id, :integer
  end
end
