class ChatsController < ApplicationController
  before_action :authenticate_user!

=begin
アクション名：index
引数：friend_relation_id（チャットルームに紐づくID）
戻り値：res（カレントユーザ情報, ヒットしたチャットレコード全件）
１：モバイルのローカルDBから自分とチャット送信相手に紐づくfriend_relation_idを指定
２：friend_relation_idで検索をかけてヒットしたチャットレコードを全件取得
３：current_userとchats(ヒットしたチャットレコード)をresに詰めて返却
=end
  def index 
    # 要編集
    @user_info = current_user
    logger.debug("ログインユーザ情報")
    logger.debug(@user_info.to_json)

    # これ、indexではできない！！
    # friend_relation_idの引数を持たせるとshowにルーティングされるため。
    # params[:friend_relation_id]で検索をかけてヒットしたものを返却
    @chats = Chat.where(friend_relation_id: params[:friend_relation_id])

    @res = {
      "user_info":@user_info,
      "chats":@chats
    }

    render json: @res
  end

end
