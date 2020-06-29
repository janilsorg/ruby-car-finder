json.extract! carro, :id, :nome, :ano, :marca_id, :created_at, :updated_at
json.url carro_url(carro, format: :json)
