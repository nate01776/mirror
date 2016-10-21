class CreateServicesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :type
      t.belongs_to :salon
    end
  end
end
