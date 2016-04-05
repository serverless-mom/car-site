class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.string :license_plate
      t.belongs_to :person, index: true


      t.timestamps null: false
    end
  end
end
