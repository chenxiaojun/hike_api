module V1
  module Account
    class SessionsController < ApplicationController
      before_action :check_params

      def create
        @api_result = send("login_by_#{params[:type]}")
      end

      private

      def login_by_vcode
        Services::Account::VcodeLoginService.call(params[:mobile], params[:vcode])
      end

      def login_by_mobile
        Services::Account::MobileLoginService.call(params[:mobile], params[:password])
      end

      def check_params
        requires! :type, values: %w[mobile vcode]
      end
    end
  end
end
