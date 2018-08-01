class CreateBanners < ActiveRecord::Migration[5.1]
  def change
    create_table :banners do |t|
      t.references :target, polymorphic: true
      t.string :target_name
      t.bigint :position, default: 0, comment: '排序'
      t.timestamps
    end
  end
end
