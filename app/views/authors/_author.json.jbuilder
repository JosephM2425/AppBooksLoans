json.extract! author, :id, :fullName, :description, :country, :created_at, :updated_at
json.url author_url(author, format: :json)
