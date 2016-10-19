class CreateSalonsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :salons do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :phone, null: false
      t.string :email
      t.string :website
      t.belongs_to :user, null: false
    end
  end
end
