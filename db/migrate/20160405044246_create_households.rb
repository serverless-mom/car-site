class CreateHouseholds < ActiveRecord::Migration
  def change
    create_table :households do |t|
      t.string :address
      t.integer :zip
      t.string :city
      t.string :state
      t.string :number_of_bedrooms

      t.timestamps null: false
    end
  end
end
