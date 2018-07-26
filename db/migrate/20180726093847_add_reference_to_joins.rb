class AddReferenceToJoins < ActiveRecord::Migration[5.1]
  def change
    add_reference :activity_joins, :activity, comment: '属于某个活动'
  end
end
