json.array!(@requests) do |request|
  json.extract! request, :type, :speciality_area_id, :case_about, :need_help, :type_person, :monthly_income, :description
  json.url request_url(request, format: :json)
end
