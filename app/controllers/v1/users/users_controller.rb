module V1
  module Users
    class UsersController < ApplicationController
      before_action :target_user

      def profile; end

      def topics
        params[:type] && optional!(:type, values: %w[short long])
        @topics = @target_user.topics.order(created_at: :desc).page(params[:page]).per(params[:page_size])
                              .yield_self { |it| params[:type] ? it.where(body_type: params[:type]) : it }
        render 'v1/topics/index'
      end

      def activities
        @activities = @target_user.activities.user_visible.order(created_at: :desc).page(params[:page]).per(params[:page_size])
        render 'v1/activities/index'
      end

      private

      def target_user
        @target_user = User.find_by!(user_uuid: params[:id])
      end
    end
  end
end
