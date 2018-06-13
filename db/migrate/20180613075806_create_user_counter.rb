class CreateUserCounter < ActiveRecord::Migration[5.1]
  def change
    create_table :user_counters do |t|
      t.references :user
      t.integer :login_count, default: 0, comment: '用户登录次数'
      t.timestamps
    end
  end
end
