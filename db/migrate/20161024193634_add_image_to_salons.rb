class AddImageToSalons < ActiveRecord::Migration[5.0]
  def up
    add_column :salons, :image, :string
  end

  def down
    remove_column :salons, :image, :string
  end
end
