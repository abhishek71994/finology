class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :car_type
      t.string :car_model
      t.string :car_variant
      t.integer :car_year

      t.timestamps
    end
  end
end
