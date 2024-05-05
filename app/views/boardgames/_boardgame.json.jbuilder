json.extract! boardgame, :id, :title, :author, :price, :rating, :created_at, :updated_at
json.url boardgame_url(boardgame, format: :json)
