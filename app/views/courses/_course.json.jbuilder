json.extract! course, :id, :title, :description, :created_at, :updated_at
json.url course_url(course, format: :json)
json.description course.description.to_s
