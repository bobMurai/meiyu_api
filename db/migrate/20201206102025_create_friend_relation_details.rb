class CreateFriendRelationDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :friend_relation_details do |t|
      # t.references :friend_relation, foreign_key: true
      # t.references :user, foreign_key: true
      t.integer :friend_status, null: false, default: 0

      t.timestamps
    end
  end
end
