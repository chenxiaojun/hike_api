json.partial! 'common/basic', api_result: ApiResult.success_result

json.data do
  json.items do
    json.array! @activities.includes(:user) do |activity|
      json.partial! 'v1/activities/base', activity: activity
      json.user do
        json.partial! 'v1/users/user_brief', user: activity.user
      end
    end
  end
end