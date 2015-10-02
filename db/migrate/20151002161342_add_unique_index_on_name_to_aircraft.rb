class AddUniqueIndexOnNameToAircraft < ActiveRecord::Migration
  def change
    add_index :aircrafts, :name, unique: true
  end
end
