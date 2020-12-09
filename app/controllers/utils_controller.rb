class UtilsController < ApplicationController
  before_action :authenticate_user!

=begin
アクション名：sync
引数：-
戻り値：res（status, data(users, friend_relations, friend_relation_details, chats)）
概要：自動ログイン時（モバイルapplication再起動時）に、RealmとMySQLを同期する。
=end
  def sync
    @account = current_user

    @chats = @account.chats
    @frds_self = @account.friend_relation_details
    @fr_ids = []
    @frds_self.each do |frd|
      @fr_ids.push(frd.friend_relation_id)
    end

    @frs = FriendRelation.where(id: @fr_ids) if @fr_ids.any?

    @friend_uids = []
    @frds_all = []
    @frs.each do |fr|
      fr.friend_relation_details.each do |f|
        @frds_all.push(f)
        @friend_uids.push(f.user_id) if f.user_id != @account.id
      end
    end

    @users = User.where(id: @friend_uids)

    @res = {
      status: "success", 
      data: {
        users: @users,
        friend_relations: @frs,
        friend_relation_details: @frds_all,
        chats: @chats
      }
    }

    render json: @res
  end
end
