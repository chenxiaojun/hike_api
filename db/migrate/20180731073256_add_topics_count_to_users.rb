class AddTopicsCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :topics_count,     :integer, default: 0, comment: '发贴数量'
    add_column :users, :activities_count, :integer, default: 0, comment: '发活动数'
  end
end
