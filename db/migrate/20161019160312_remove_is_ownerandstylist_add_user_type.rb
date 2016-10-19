class RemoveIsOwnerandstylistAddUserType < ActiveRecord::Migration[5.0]
  def up
    remove_column :users, :is_owner, :boolean
    remove_column :users, :is_stylist, :boolean
    add_column :users, :user_type, :string, null: false, default: 'client'
  end

  def down
    remove_column :users, :user_type, :string
    add_column :users, :is_owner, :boolean, null: false, default: false
    add_column :users, :is_stylist, :boolean, null: false, default: false
  end
end
