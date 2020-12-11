class AddReferencesToFriendRelationDetail < ActiveRecord::Migration[5.2]
  def change
    add_reference :friend_relation_details, :user, foreign_key: true
    add_reference :friend_relation_details, :friend_relation, foreign_key: true
  end
end
