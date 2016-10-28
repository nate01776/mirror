class ChangeClientservicesTable < ActiveRecord::Migration[5.0]
  def up
    rename_column :clientservices, :stylistservice_id, :stylist_id
    add_column :clientservices, :service_id, :integer, null: false
    add_column :clientservices, :salon_id, :integer, null: false
  end

  def down
    rename_column :clientservices, :stylist_id, :stylistservice_id
    remove_column :clientservices, :service_id, :integer, null: false
    remove_column :clientservices, :salon_id, :integer, null: false
  end
end
