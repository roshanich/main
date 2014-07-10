json.array!(@scraps) do |scrap|
  json.extract! scrap, :id, :url, :title, :desc, :image, :price
  json.url scrap_url(scrap, format: :json)
end
