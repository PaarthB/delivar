class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps null: false
    end
  end
end
