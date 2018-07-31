module V1
  module Activities
    class JoinController < ApplicationController
      include UserAuthorize
      before_action :login_required
      before_action :set_activity
      # 用户报名参加活动
      # 已经报名的不能再次参加 只有进行中的活动才允许报名
      def create
        requires! :name
        requires! :mobile
        raise_error 'cannot_apply' unless @activity.allow_join?
        raise_error 'already_joined' if @activity.user_joined?(@current_user)
        Services::Activities::Join.call(@current_user, @activity, user_params)
        render_api_success
      end

      # 发起人 成员管理
      def members
        @members = @activity.activity_joins.order(created_at: :desc)
      end

      # 通过或拒绝报名成员
      def update
        @member = @activity.activity_joins.find(params[:id])
        requires! :status, values: %w[passed failed]
        @member.update(join_status: params[:status], response_message: params[:message])
        render_api_success
      end

      private

      def user_params
        params.permit(:name, :mobile, :emerge_username, :emerge_mobile, :message)
      end

      def set_activity
        @activity = Activity.find(params[:activity_id])
      end
    end
  end
end
