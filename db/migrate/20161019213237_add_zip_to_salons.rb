class AddZipToSalons < ActiveRecord::Migration[5.0]
  def up
    add_column :salons, :zip_code, :string, null: false
  end

  def down
    remove_column :salons, :zip_code, :string
  end
end
