class ChatsController < ApplicationController
  before_action :authenticate_user!

  def create
    @uid = current_user.id
    @chat = Chat.create(friend_relation_id: params[:friend_relation_id], user_id: @uid, content: params[:content])
    @res = {status: "success", data: @chat}

    render json: @res

  end

end
