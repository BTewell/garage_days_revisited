class AddEventIdColumnToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :event_id, :integer
  end
end
