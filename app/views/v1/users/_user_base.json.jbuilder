json.user_id            user.user_uuid
json.nick_name          user.nick_name
json.user_name          user.user_name
json.gender             user.gender
json.mobile             user.mobile
json.email              user.email
json.birthday           user.birthday.to_s
json.avatar             user.avatar_path.to_s
json.reg_date           user.reg_date.to_i
json.last_visit         user.last_visit.to_i
json.signature          user.signature.to_s
json.mark               user.mark.to_s
json.topics_count       user.topics_count
json.activities_count   user.activities_count
json.created_at         user.created_at.to_i
