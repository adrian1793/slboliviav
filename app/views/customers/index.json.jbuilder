json.array!(@customers) do |customer|
  json.extract! customer, :first_name, :middle_name, :last_name, :company, :ci, :orgin, :date_of_birth, :gender, :address, :department_id, :city_id, :phone, :cell_phone, :user_id
  json.url customer_url(customer, format: :json)
end
