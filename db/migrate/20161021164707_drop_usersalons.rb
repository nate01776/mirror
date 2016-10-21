class DropUsersalons < ActiveRecord::Migration[5.0]
  def change
    drop_table :usersalons
  end
end
