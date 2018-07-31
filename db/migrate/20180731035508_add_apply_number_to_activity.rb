class AddApplyNumberToActivity < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :apply_numbers, :integer, default: 0, comment: '报名人数'
  end
end
