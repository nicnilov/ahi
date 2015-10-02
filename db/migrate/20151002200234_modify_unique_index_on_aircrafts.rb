class ModifyUniqueIndexOnAircrafts < ActiveRecord::Migration
  def up
    remove_index :aircrafts, :name
    add_index :aircrafts, [:name, :variant_type], unique: true, name: :aircrafts_unique
  end

  def down
    remove_index :aircrafts, name: :aircrafts_unique
    add_index :aircrafts, :name, unique: true
  end
end
