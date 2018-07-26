class AddStatusToActivity < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :departure_province, :string, default: '', comment: '出发的省份'
    add_column :activities, :destination_city, :string, default: '', comment: '目的城市'
    add_column :activities, :canceled, :boolean, default: false, comment: '活动是否取消'
    add_column :activities, :canceled_reason, :string, default: '', comment: '取消的原因'
    add_column :activities, :mem_limit, :integer, default: '', comment: '限制报名的人数'
  end

  create_table :activity_joins do |t|
    t.references :user
    t.string :name, default: '', comment: '姓名'
    t.string :mobile, default: '', comment: '报名的手机号'
    t.string :emerge_username, default: '', comment: '紧急联系人'
    t.string :emerge_mobile, default: '', comment: '紧急联系电话'
    t.text   :message, comment: '给发起者的消息'
    t.string :join_status, default: 'pending', comment: 'pending->申请中, passed->报名通过, failed->拒绝报名'
    t.text   :response_message, comment: '活动发起人返回的消息'
    t.timestamps
  end
end
