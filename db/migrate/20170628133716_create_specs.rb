class CreateSpecs < ActiveRecord::Migration[5.1]
  def change
    create_table :specs do |t|
      t.text :content
      t.integer :function_id

      t.timestamps
    end
  end
end
