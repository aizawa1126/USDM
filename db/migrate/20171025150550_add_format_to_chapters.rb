class AddFormatToChapters < ActiveRecord::Migration[5.1]
  def change
    add_column :chapters, :format, :string, default: "usdm"
  end
end
