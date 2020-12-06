class FriendRelation < ApplicationRecord
  has_many :chats, dependent: :destroy
  has_many :friend_relation_details, dependent: :destroy
end
