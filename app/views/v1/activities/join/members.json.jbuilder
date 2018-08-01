json.partial! 'common/basic', api_result: ApiResult.success_result

json.data do
  json.array! @members.includes(:user) do |member|
    json.partial! 'v1/activities/member', member: member
  end
end