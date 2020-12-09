class FriendRelationsController < ApplicationController
  before_action :authenticate_user!

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

=begin
アクション名：update
引数：id(friend_relation_id), friend_status(=3or4→承認or却下)
戻り値：res（status, 更新後のfriend_relations情報）
概要：meiyu申請に対する返答（承認or却下）があった際にfrと紐づくfrdのステータスを更新する。
=end
  def update
    @f_status = params[:friend_status]
    @fr_id = params[:id]

    @fr = FriendRelation.find(@fr_id) 
    @fr.friend_relation_details.each do |frd|
      frd.update(friend_status: @f_status)
    end

    @res = {status: "success", data: @fr.friend_relation_details}

    render json: @res
  end
end
