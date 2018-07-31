module V1
  module Users
    class ShareCountController < ApplicationController
      include UserAuthorize
      before_action :user_self_required

      def create
        # 分享次数 + 1
        @current_user.increase_share_count
        render_api_success
      end
    end
  end
end
