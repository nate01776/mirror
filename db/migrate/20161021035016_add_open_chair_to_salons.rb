class AddOpenChairToSalons < ActiveRecord::Migration[5.0]
  def up
    add_column :salons, :open_chair_count, :integer, null: false, default: 0
  end

  def down
    remove_column :salons, :open_chair_count, :integer
  end
end
