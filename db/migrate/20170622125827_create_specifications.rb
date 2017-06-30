class CreateSpecifications < ActiveRecord::Migration[5.1]
  def change
    create_table :specifications do |t|
      t.string :title
      t.integer :version

      t.timestamps
    end
  end
end
