class AddFriendRelationIdToChat < ActiveRecord::Migration[5.2]
  def change
    add_reference :chats, :friend_relation, foreign_key: true
  end
end
