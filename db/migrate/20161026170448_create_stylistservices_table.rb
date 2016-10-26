class CreateStylistservicesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :stylistservices do |t|
      t.belongs_to :service, null: false
      t.belongs_to :user, null: false
    end
  end
end
