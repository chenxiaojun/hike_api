module V1
  module Users
    class FollowersController < ApplicationController
      include UserAuthorize
      before_action :user_self_required, except: [:index]

      # 查看用户粉丝列表
      def index
        @target_user = User.find_by!(user_uuid: params[:user_id])
        @followers = @target_user.follow_by_users
      end

      # 移除粉丝
      def destroy
        @target_user = User.find_by!(user_uuid: params[:id])
        @target_user.destroy_action(:follow, target: @current_user)
        render_api_success
      end
    end
  end
end
