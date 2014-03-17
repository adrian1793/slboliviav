ActiveAdmin.register Customer do
  index do
    column :full_name
    column :ci
    column :date_of_birth
    column :gender
    column :company
    column :address
    column :city
    default_actions
  end

  index :as => :grid do |customer|
    link_to(customer.full_name, admin_customer_path(customer))
  end

  show  do
    @requests = Request.where( customer_id: customer.id)
    render 'requests/index_admin', locals: { requests: @requests }
  #  active_admin_comments
  end

  config.sort_order = "middle_name_asc"


  filter :first_name
  filter :middle_name
  filter :last_name
  filter :ci
  filter :gender
  filter :city




end
