class AddStateColumnToSalons < ActiveRecord::Migration[5.0]
  def up
    add_column :salons, :state, :string, null: false
  end

  def down
    remove_column :salons, :state, :string
  end
end
