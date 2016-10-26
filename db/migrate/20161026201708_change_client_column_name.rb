class ChangeClientColumnName < ActiveRecord::Migration[5.0]
  def up
    rename_column :clientservices, :client_id, :user_id
    add_column :clientservices, :datetime, :string, null: false
  end

  def down
    rename_column :clientservices, :user_id, :client_id
    remove_column :clientservices, :datetime, :string
  end
end
