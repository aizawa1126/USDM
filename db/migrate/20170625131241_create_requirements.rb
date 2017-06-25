class CreateRequirements < ActiveRecord::Migration[5.1]
  def change
    create_table :requirements do |t|
      t.integer :number
      t.string :content
      t.string :reason
      t.string :description
      t.integer :section_id

      t.timestamps
    end
  end
end
