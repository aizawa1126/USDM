class AddColumnToSpec < ActiveRecord::Migration[5.1]
  def change
    add_column :specs, :number, :interger
    add_column :specs, :customer_review, :boolean, default: false
    add_column :specs, :design_review, :boolean, default: false
    add_column :specs, :test_review, :boolean, default: false
  end
end
