json.array!(@caminputs) do |caminput|
  json.extract! caminput, :id, :username, :type
  json.url caminput_url(caminput, format: :json)
end
