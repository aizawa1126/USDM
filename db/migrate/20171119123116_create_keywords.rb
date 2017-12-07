class CreateKeywords < ActiveRecord::Migration[5.1]
  def change
    create_table :keywords do |t|
      t.string :name
      t.integer :project_id

      t.timestamps
    end
  end
end
