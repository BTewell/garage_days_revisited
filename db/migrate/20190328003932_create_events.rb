class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :date_range
      t.string :time
      t.string :address
      t.string :details

      t.timestamps
    end
  end
end
