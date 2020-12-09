class FriendRelationsController < ApplicationController
  # before_action :authenticate_user!

=begin
アクション名：create
引数：user_id（申請者のuser_id）
戻り値：res（status, 登録したfriend_relations情報）
概要：meiyu申請があった際にfrと紐づくfrdを新たに作成する。
=end
  def create
    @uid_self = current_user.id
    @uid_other = params[:user_id]
    @fr = FriendRelation.create()
    @frd_self = FriendRelationDetail.create(user_id: @uid_self, friend_relation_id: @fr.id, friend_status: 1)
    @frd_self = FriendRelationDetail.create(user_id: @uid_self, friend_relation_id: @fr.id, friend_status: 2)

    @res = {status: "success", data: @fr}

    render json: @res
  end
end
