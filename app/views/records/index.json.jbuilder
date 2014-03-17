json.array!(@records) do |record|
  json.extract! record, :name, :record
  json.url record_url(record, format: :json)
end
