class CreateManufacturers < ActiveRecord::Migration
  def change
    create_table :manufacturers do |t|
      t.string :name
      t.string :full_name
      t.string :slug
      t.datetime :founded_at
      t.datetime :defunct_at
      t.timestamps
    end

    create_table :aircrafts_manufacturers, id: false do |t|
      t.integer :aircraft_id, null: false
      t.integer :manufacturer_id, null: false
    end
  end
end
