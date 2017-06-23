class CreateChapters < ActiveRecord::Migration[5.1]
  def change
    create_table :chapters do |t|
      t.integer :number
      t.string :name
      t.string :prefix
      t.integer :specification_id

      t.timestamps
    end
  end
end
