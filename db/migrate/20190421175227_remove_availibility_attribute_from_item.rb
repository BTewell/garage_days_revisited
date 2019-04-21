class RemoveAvailibilityAttributeFromItem < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :availability, :boolean
  end
end
