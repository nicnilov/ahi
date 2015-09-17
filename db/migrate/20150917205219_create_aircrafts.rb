class CreateAircrafts < ActiveRecord::Migration
  def change
    create_table :aircrafts do |t|
      t.string :name
      t.string :slug
      t.datetime :conceived_at
      t.datetime :flown_at
      t.datetime :introduced_at
      t.datetime :retired_at
      t.datetime :produced_since
      t.datetime :produced_till
      t.integer :number_built
      t.timestamps
    end
  end
end
