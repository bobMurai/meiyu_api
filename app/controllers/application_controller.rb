class ApplicationController < ActionController::API
        include DeviseTokenAuth::Concerns::SetUserByToken
        rescue_from Exception, with: :handle_err

        private
        # エラー時のレスポンスを返す
        def handle_err(e)
                header = {result: e.code, message: e.message}
                res = {status: "fail", header: header}
                render json: res
        end
end
