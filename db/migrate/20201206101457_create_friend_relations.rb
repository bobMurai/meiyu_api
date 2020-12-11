class CreateFriendRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :friend_relations do |t|

      t.timestamps
    end
  end
end
