class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.integer :aircraft_id, null: false
      t.integer :variant_id, null: false
    end
  end
end
