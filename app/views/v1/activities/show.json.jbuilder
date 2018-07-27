json.partial! 'common/basic', api_result: ApiResult.success_result

json.data do
  @members = @activity.activity_joins
  json.partial! 'v1/activities/base_info', activity: @activity
  json.user do
    json.partial! 'v1/users/user_brief', user: @activity.user
  end

  json.activity_members do
    json.array! @members.includes(:user) do |member|
      json.user_id member.user.user_uuid
      json.nick_name member.user.nick_name
      json.gender member.user.gender
      json.apply_time member.user.created_at.to_i
      json.activity_owner member.owner
    end
  end
  json.current_user_joined @activity.user_joined?(@current_user)
end