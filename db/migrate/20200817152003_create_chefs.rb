class CreateChefs < ActiveRecord::Migration[6.0]
  def change
    create_table :chefs do |t|
      t.text :description
      t.string :cuisine
      t.integer :location_range
      t.integer :rating
      t.integer :price
      t.string :chef_postcode
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
