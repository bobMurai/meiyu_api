class AddDetailsToChats < ActiveRecord::Migration[5.2]
  def change
    add_column :chats, :content, :text
    add_column :chats, :friend_relation_id, :integer
  end
end
