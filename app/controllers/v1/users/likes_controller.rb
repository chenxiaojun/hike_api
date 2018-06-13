module V1
  module Users
    class LikesController < ApplicationController
      include UserAuthorize
      before_action :user_self_required
      before_action :target, except: [:index]

      # 用户喜欢列表，keyword用来获取某个类别喜欢列表
      def index
        keyword = params[:keyword]
        @like_actions = @current_user.action_likes.page(params[:page]).per(params[:page_size])
                                    .yield_self { |it| keyword ? it.where(target_type: keyword.classify) : it }
      end

      # 说说长帖点赞
      def create
        @current_user.create_action(:like, target: @target)
      end

      # 取消点赞
      def cancel
        @current_user.destroy_action(:like, target: @target)
      end

      private

      def target
        requires! :target_id
        requires! :target_type, values: %w[topic]
        @target = params[:target_type].classify.safe_constantize.find(params[:target_id])
      end
    end
  end
end
