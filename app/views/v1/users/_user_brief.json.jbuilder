json.user_id            user.user_uuid
json.nick_name          user.nick_name
json.gender             user.gender
json.avatar             user.avatar_path.to_s
json.reg_date           user.reg_date.to_i
json.signature          user.signature.to_s
json.following_count    user.following_count
json.followers_count    user.followers_count
json.topics_count       user.topics_count
json.activities_count   user.activities_count
json.created_at         user.created_at.to_i
