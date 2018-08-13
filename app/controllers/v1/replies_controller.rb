module V1
  class RepliesController < ApplicationController
    include UserAuthorize
    before_action :login_required
    before_action :target, except: [:destroy]

    def create
      requires! :body
      comment? ? create_comment_replies : create_reply_replies
    end

    def destroy
      Reply.find(params[:id]).destroy!
      render_api_success
    end

    private

    def create_comment_replies
      @reply = Reply.create!(user_id: @current_user.id,
                             body: params[:body],
                             comment_id: @target.id,
                             target: @target.target,
                             reply_user_id: @target.user.id)
    end

    def create_reply_replies
      @reply = Reply.create!(user_id: @current_user.id,
                             body: params[:body],
                             comment_id: @target.comment.id,
                             target: @target.target,
                             reply_id: @target.id,
                             reply_user_id: @target.user.id)
    end

    def target
      requires! :target_id
      requires! :target_type, values: %w[comment reply]
      @target = comment? ? Comment.find(params[:target_id]) : Reply.find(params[:target_id])
    end

    def comment?
      params[:target_type].eql? 'comment'
    end
  end
end
