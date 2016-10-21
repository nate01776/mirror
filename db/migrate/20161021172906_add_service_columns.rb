class AddServiceColumns < ActiveRecord::Migration[5.0]
  def up
    add_column :services, :price, :string
    add_column :services, :time, :string
  end
  def down
    remove_column :services, :price, :string
    remove_column :services, :time, :string
  end
end
