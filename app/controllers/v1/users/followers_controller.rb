module V1
  module Users
    class FollowersController < ApplicationController
      include UserAuthorize
      before_action :user_self_required, except: [:index]

      # 查看用户粉丝列表
      def index
        @target_user = User.by_uuid(params[:user_id])
        raise_error 'record_not_found' if @target_user.blank?
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
