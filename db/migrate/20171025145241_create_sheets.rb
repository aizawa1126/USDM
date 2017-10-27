class CreateSheets < ActiveRecord::Migration[5.1]
  def change
    create_table :sheets do |t|
      t.text :content
      t.integer :chapter_id

      t.timestamps
    end
  end
end
