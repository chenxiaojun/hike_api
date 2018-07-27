class AddJoinNumbersToActivity < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :join_numbers, :integer, default: 0, comment: '报名通过的人数'
    remove_column :activities, :start_date
    remove_column :activities, :end_date
  end
end
