module Services
  module Activities
    class Join
      include Serviceable

      def initialize(user, activity, user_params = {})
        @user = user
        @activity = activity
        @user_params = user_params
      end

      def call
        params = {
          name: @user_params.delete(:name) || @user.nick_name,
          mobile: @user_params.delete(:mobile) || @user.mobile
        }.merge(@user_params)
        owner? ? create_owner(params) : create_user(params)
      end

      private

      def owner?
        @user.eql? @activity.user
      end

      def create_owner(params)
        ActivityJoin.create!(params.merge(user: @user, activity: @activity, join_status: 'passed', owner: true))
        @activity.increment_join_numbers
      end

      def create_user(params)
        ActivityJoin.create(params.merge(user: @user, activity: @activity))
      end
    end
  end
end
