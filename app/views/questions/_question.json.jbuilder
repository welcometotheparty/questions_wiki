json.extract! question, :id, :head, :body, :created_at, :updated_at
json.url question_url(question, format: :json)
