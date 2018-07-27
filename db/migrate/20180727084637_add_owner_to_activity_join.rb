class AddOwnerToActivityJoin < ActiveRecord::Migration[5.1]
  def change
    add_column :activity_joins, :owner, :boolean, default: false, comment: '是否是发起者'
  end
end
