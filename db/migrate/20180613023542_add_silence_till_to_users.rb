class AddSilenceTillToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users,    :silenced,          :boolean,  default: false, comment: '是否被禁言'
    add_column :users,    :silence_at,        :datetime,                 comment: '被禁言的时间'
    add_column :users,    :silence_till,      :datetime,                 comment: '解禁的时间'
    add_column :users,    :silence_reason,    :string,   default: '',    comment: '被禁言的原因'
    add_column :users,    :blocked,           :boolean,  default: false, comment: '是否被拉入黑名单'
    add_column :users,    :followers_count,   :integer,  default: 0, comment: '粉丝数'
    add_column :users,    :following_count,   :integer,  default: 0, comment: '关注数'
  end
end

