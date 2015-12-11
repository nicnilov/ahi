class ChangeManufacturerNaming < ActiveRecord::Migration
  def change
    rename_column :manufacturers, :full_name, :partial_name
  end
end
