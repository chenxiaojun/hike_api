module V1
  module Account
    # 发送验证码的接口
    class VCodesController < ApplicationController
      include UserAuthorize
      before_action :login_need?
      OPTION_TYPES = %w[register login reset_pwd change_pwd bind_account unbind_account
                        change_old_account bind_new_account bind_wx_account].freeze

      VCODE_TYPES = %w[mobile email].freeze

      def create
        requires! :vcode_type, values: VCODE_TYPES
        requires! :option_type, values: OPTION_TYPES
        Services::Account::VcodeServices.call(@current_user, user_params)
        render_api_success
      end

      private

      def user_params
        params.permit(:option_type, :vcode_type, :mobile, :email)
      end

      def login_need?
        if params[:option_type].eql?('change_old_account')
          login_required
        else
          @current_user = nil
        end
      end
    end
  end
end

