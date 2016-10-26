class AddClientservicesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :clientservices do |t|
      t.belongs_to :client, null: false
      t.belongs_to :stylistservice, null: false
    end
  end
end
