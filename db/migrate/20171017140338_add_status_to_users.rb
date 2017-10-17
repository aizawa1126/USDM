class AddStatusToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :status, :string, default: "registered"
  end
end