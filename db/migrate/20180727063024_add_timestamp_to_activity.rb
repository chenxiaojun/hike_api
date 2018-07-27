class AddTimestampToActivity < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :begin_time, :datetime, comment: '活动开始时间'
    add_column :activities, :end_time, :datetime, comment: '活动结束时间'
    add_index :activities, :begin_time
    add_index :activities, :end_time
  end
end
