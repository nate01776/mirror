class CreateSalonusers < ActiveRecord::Migration[5.0]
  def change
    create_table :salonusers do |t|
      t.belongs_to :user
      t.belongs_to :salon
    end
  end
end
