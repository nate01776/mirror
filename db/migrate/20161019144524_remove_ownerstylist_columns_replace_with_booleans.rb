class RemoveOwnerstylistColumnsReplaceWithBooleans < ActiveRecord::Migration[5.0]
  def up
    remove_column :users, :is_owner, :string
    remove_column :users, :is_stylist, :string
    add_column :users, :is_owner, :boolean, null: false, default: false
    add_column :users, :is_stylist, :boolean, null: false, default: false
  end

  def down
    remove_column :users, :is_owner, :boolean
    remove_column :users, :is_stylist, :boolean
    add_column :users, :is_owner, :string, null: false, default: "f"
    add_column :users, :is_stylist, :string, null: false, default: "f"
  end
end
