json.id                   activity.id
json.cover_link           activity.cover_link
json.name                 activity.name
json.begin_time           activity.begin_time.to_i
json.end_time             activity.end_time.to_i
json.departure_city       activity.departure_city
json.destination_province activity.destination_province
json.destination          activity.destination
json.start_date           activity.start_date
json.end_date             activity.end_date
json.charge_type          activity.charge_type.to_s
json.description          activity.description.to_s
json.page_views           activity.page_views
json.created_at           activity.created_at.to_i