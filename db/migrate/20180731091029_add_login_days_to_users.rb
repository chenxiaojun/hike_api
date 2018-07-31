class AddLoginDaysToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :user_counters, :login_days,  :integer, default: 0, comment: '登录天数'
    add_column :user_counters, :share_count, :integer, default: 0, comment: '分享次数'
  end
end
