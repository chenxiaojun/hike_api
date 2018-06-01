json.partial! 'common/basic', api_result: ApiResult.success_result

json.data do
  json.access_token @api_result.data[:access_token]
  json.partial! 'v1/users/user_base', user: @api_result.data[:user]
end
