module V1
  module Users
    class FollowingController < ApplicationController
      include UserAuthorize
      before_action :user_self_required, except: [:index]

      # 获取关注列表
      def index
        @target_user = User.find_by!(user_uuid: params[:user_id])
        @followings = @target_user.follow_users
      end

      # 关注某人
      def create
        @target_user = User.find_by!(user_uuid: params[:target_id])
        raise_error 'cannot_follow_self' if @current_user.eql?(@target_user)
        @current_user.create_action(:follow, target: @target_user)
        render_api_success
      end

      # 取消关注某人
      def destroy
        @target_user = User.find_by!(user_uuid: params[:id])
        @current_user.destroy_action(:follow, target: @target_user)
        render_api_success
      end

      def uids
        @uids = User.find(@current_user.follow_user_ids).pluck(:user_uuid)
      end
    end
  end
end
