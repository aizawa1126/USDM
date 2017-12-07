class CreateSpecKeywords < ActiveRecord::Migration[5.1]
  def change
    create_table :spec_keywords do |t|
      t.integer :spec_id
      t.integer :keyword_id

      t.timestamps
    end
  end
end
