json.extract! client, :id, :name, :mail, :telephone, :created_at, :updated_at
json.url client_url(client, format: :json)