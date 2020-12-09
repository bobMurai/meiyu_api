class ApplicationController < ActionController::API
        include DeviseTokenAuth::Concerns::SetUserByToken
        rescue_from Exception, with: :handle_err

        private
        # エラー時のレスポンスを返す
        def handle_err(e)
                res = {status: "fail", message: e.message}
                render json: res
        end
end
