class ChangeDateRangeAndTimeColumsInEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :date_range, :string
    remove_column :events, :time, :string
    add_column :events, :start_date, :date
    add_column :events, :end_date, :date
    add_column :events, :start_time, :time
    add_column :events, :end_time, :time
  end
end
