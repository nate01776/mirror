class RemoveSalonIdColumnFromClientservices < ActiveRecord::Migration[5.0]
  def up
    remove_column :clientservices, :salon_id, :integer
  end

  def down
    add_column :clientservices, :salon_id, :integer, null: false
  end
end
