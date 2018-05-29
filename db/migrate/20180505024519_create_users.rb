class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string   :user_uuid,    limit: 32, null: false,    comment: '用户的uuid'
      t.string   :user_name,    limit: 32,                 comment: '用户姓名，唯一'
      t.string   :nick_name,    limit: 32,                 comment: '用户的昵称'
      t.string   :password,     limit: 32,                 comment: '用户的密码'
      t.string   :password_salt,           default: '',    comment: '密码盐值'
      t.integer  :gender,                  default: 0,     comment: '用户性别, 0表示男，1表示女'
      t.string   :email,                   default: '',    comment: '用户邮箱'
      t.string   :mobile,                  default: '',    comment: '用户手机号'
      t.string   :avatar,                  default: '',    comment: '用户头像'
      t.string   :wx_avatar,               default: '',    comment: '微信头像'
      t.date     :birthday,                default: '',    comment: '用户生日'
      t.datetime :reg_date,                                comment: '注册日期'
      t.datetime :last_visit,                              comment: '上次登录时间'
      t.string   :signature,                               comment: '个性签名'
      t.datetime :blocked_at,                              comment: '被拉入黑名单时间'
      t.string   :mark,                                    comment: '备注'
      t.float    :lat
      t.float    :lng
      t.timestamps
    end
    add_index :users, [:user_uuid]
    add_index :users, [:nick_name]
    add_index :users, [:email]
    add_index :users, [:mobile]
    add_index :users, [:blocked_at]

    create_table :user_extras do |t|
      t.references :user
      t.string :real_name, limit: 50,                  comment: '真实姓名'
      t.string :cert_type, limit: 50,                  comment: 'chinese_id'
      t.string :cert_no,                               comment: '证件号码'
      t.string :mark,                                  comment: '备注'
      t.string :image,                                 comment: '身份证图片'
      t.string :status,    limit: 20, default: 'init', comment: '审核中-pending, 审核通过-passed, 审核失败-failed'
      t.datetime :deleted_at,  comment: '删除时间'
      t.boolean :default,  default: false,             comment: '是否默认'
      t.timestamps
    end
    add_index :user_extras, [:deleted_at]
    add_index :user_extras, [:status]

    create_table :weixin_users do |t|
      t.references :user
      t.string :open_id,          comment: '用户的open_id'
      t.string :nick_name,        comment: '用户昵称'
      t.integer :sex,              comment: '用户性别'
      t.string :province,         comment: '用户所在的省份'
      t.string :city,             comment: '用户所在的城市'
      t.string :country,          comment: '用户所在的省份'
      t.string :head_img,         comment: '用户头像'
      t.string :privilege,        comment: '用户权限列表'
      t.string :union_id,         comment: 'union id'
      t.string :access_token
      t.string :expires_in
      t.string :refresh_token
      t.timestamps
    end
    add_index :weixin_users, [:open_id]
    add_index :weixin_users, [:nick_name]
    add_index :weixin_users, [:access_token]
  end
end
