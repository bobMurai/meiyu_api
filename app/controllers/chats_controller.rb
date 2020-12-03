class ChatsController < ApplicationController
  before_action :authenticate_user!
  def index
    @chats = Chat.all
    render json: @chats
  end
end
