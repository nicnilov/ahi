class AddVariantTypeToAircraft < ActiveRecord::Migration
  def change
    add_column :aircrafts, :variant_type, :string, null: false
    add_index :aircrafts, :variant_type, using: :btree
  end
end
