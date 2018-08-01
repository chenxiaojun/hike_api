class AddFavoritesCountToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :favorites_count, :integer, default: 0, comment: '收藏数'
  end
end
