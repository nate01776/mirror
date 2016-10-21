class AddProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :service_type
      t.string :price
      t.boolean :in_stock
      t.belongs_to :salon
    end
  end
end
