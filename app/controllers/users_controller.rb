class UsersController < ApplicationController
  before_action :authenticate_user!

=begin
アクション名：update
引数：user（更新用ユーザ情報）
戻り値：status, user（更新後ユーザ情報）
=end
  def update
    @user = current_user
    @user.update(user_params)

    @res = {status: "success", data: @user}

    render json: @res
  end

=begin
アクション名：register
引数：更新後ユーザ情報
戻り値：user_info（更新後ユーザ情報）
=end
  # def register
  #   logger.debug("registerアクション起動")
  #   if @user = User.find(user_params[:id]) then
  #     logger.debug("user特定:#{@user/to_json}")

  #     if @user.update(user_params) then
  #       logger.debug("user情報更新:#{@user/to_json}")

  #       render json: {
  #         "user_info":@user
  #       }
  #     else
  #       logger.debug("更新失敗")

  #       render json: {"error":"can't update user info"}
  #     end
  #   else
  #     logger.debug("更新失敗")
  #     render json: {"error":"user not found"}
  #   end
  # end

  private
  def user_params
    params.require(:user) \
      .permit(:id, :email, :nickname, :photo_url ,:nearest_station, \
        :birthday, :social_position, :job, :introduction)
  end

end
