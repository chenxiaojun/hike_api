json.partial! 'common/basic', api_result: ApiResult.success_result

json.data do
  @members = @activity.activity_joins
  json.partial! 'v1/activities/base_info', activity: @activity
  json.user do
    json.partial! 'v1/users/user_brief', user: @activity.user
  end

  json.activity_members do
    json.array! @members.includes(:user) do |member|
      json.partial! 'v1/activities/member', member: member
    end
  end
  json.current_user_joined @activity.user_joined?(@current_user)
end