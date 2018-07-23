class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.references :user
      t.string     :cover_link, default: '', comment: '活动封面海报'
      t.string     :name, default: '', comment: '活动名称'
      t.datetime   :begin_time, comment: '活动开始时间'
      t.datetime   :end_time, comment: '活动结束时间'
      t.string     :departure_city, default: '', comment: '出发城市'
      t.string     :destination_province, default: '', comment: '目的省份'
      t.string     :destination, default: '', comment: '具体目的地'
      t.date       :start_date, comment: '出发日期'
      t.date       :end_date, comment: '结束日期'
      t.string     :charge_type, default: 'free', comment: '收费类型 free-免费'
      t.text       :description, comment: '活动描述'
      t.string     :auth_status, default: 'passed', comment: 'passed->审核通过默认, failed审核失败不展示'
      t.integer    :comments_count, default: 0, comment: '评论数'
      t.integer    :replies_count, default: 0, comment: '回复数'
      t.integer    :likes_count, default: 0, comment: '喜欢数'
      t.integer    :page_views, default: 0, comment: '浏览量'
      t.timestamps
    end

    create_table :activity_images do |t|
      t.string :image
      t.timestamps
    end
  end
end
