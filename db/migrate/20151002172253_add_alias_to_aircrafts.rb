class AddAliasToAircrafts < ActiveRecord::Migration
  def change
    add_column :aircrafts, :alias, :string
  end
end
