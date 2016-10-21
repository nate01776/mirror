class RenameColumnToOwnerid < ActiveRecord::Migration[5.0]
  def up
    rename_column :salons, :user_id, :owner_id
  end

  def down
    rename_column :salons, :owner_id, :user_id
  end
end
