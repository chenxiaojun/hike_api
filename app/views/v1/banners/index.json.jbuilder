json.partial! 'common/basic', api_result: ApiResult.success_result

json.data do
  json.items do
    json.array! @banners do |banner|
      json.image_url    banner.target.cover_link
      json.target_type  banner.target_type.downcase
      json.target_id    banner.target_id
    end
  end
end
