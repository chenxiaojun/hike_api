module V1
  module Users
    class LoginCountController < ApplicationController
      include UserAuthorize
      before_action :user_self_required

      def create
        # 访问次数 + 1
        @current_user.increase_login_count
        # 更新访问时间
        @current_user.touch_visit!
        render_api_success
      end
    end
  end
end
