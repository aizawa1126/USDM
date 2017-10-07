class CreatePermissions < ActiveRecord::Migration[5.1]
  def change
    create_table :permissions do |t|
      t.integer :role_id
      t.integer :operation_id

      t.timestamps
    end
  end
end
