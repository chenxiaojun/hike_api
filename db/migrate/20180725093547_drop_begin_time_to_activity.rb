class DropBeginTimeToActivity < ActiveRecord::Migration[5.1]
  def change
    remove_column :activities, :begin_time
    remove_column :activities, :end_time
  end
end
