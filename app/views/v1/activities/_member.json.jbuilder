json.member_id         member.id
json.user_id           member.user.user_uuid
json.nick_name         member.user.nick_name
json.avatar            member.user.avatar.to_s
json.gender            member.user.gender
json.apply_time        member.created_at.to_i
json.message           member.message.to_s
json.join_status       member.join_status
json.apply_detail do
  json.name            member.name
  json.mobile          member.mobile
  json.emerge_username member.emerge_username
  json.emerge_mobile   member.emerge_mobile
end
json.activity_owner    member.owner