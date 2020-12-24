class Chat < ApplicationRecord
  belongs_to :friend_relation
  belongs_to :user
end
