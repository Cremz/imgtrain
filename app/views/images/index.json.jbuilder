json.array!(@images) do |image|
  json.extract! image, :id, :image, :title, :ip, :delete_code
  json.url image_url(image, format: :json)
end
