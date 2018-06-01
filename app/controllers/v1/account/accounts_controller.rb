module V1
  module Account
    # 处理注册相关的业务逻辑
    class AccountsController < ApplicationController
      before_action :check_params

      def create
        register_type = params[:type]
        send("register_by_#{register_type}")
      end

      private

      def register_by_mobile
        mobile_register_service = Services::Account::MobileRegisterService
        @api_result = mobile_register_service.call(user_params)
      end

      def register_by_email
        email_register_service = Services::Account::EmailRegisterService
        @api_result = email_register_service.call(user_params)
      end

      def user_params
        params.permit(:type, :email, :mobile, :password, :vcode)
      end

      # 只允许手机号注册，如果想开放邮箱注册，这里添加一个email就可以了
      def check_params
        requires! :type, values: %w[mobile]
      end
    end
  end
end
