class AddPictureToSpecs < ActiveRecord::Migration[5.1]
  def change
    add_column :specs, :picture, :string
  end
end
