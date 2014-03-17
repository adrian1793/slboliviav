ActiveAdmin.register Request do


  scope :all, :default => true
  scope :new_request
  scope :process_request
  scope :established_request


  permit_params :method_payment_id, :speciality_area_id, :case_about_id, :need_help_id, :customer_id,
                :type, :type_person, :monthly_income, :description, :state


  index do
    column :type

    column ('speciality area') { |request| request.speciality_area.name }
    column ('case about') { |request| request.case_about.name }
    column ('need_help') { |request| request.need_help.name }
    column ('state') { |request| status_tag (request.state == 'New'  ? 'New' : request.state),(request.state=='New'  ? :error : :ok) }
    column "customer" do |request|
      link_to request.customer.full_name, admin_customer_path(request.customer)
    end

    column :type_person


    default_actions
  end


  show do
    h3 "Customer: "+ request.customer.full_name
    panel "Request Details" do
      attributes_table_for request do
        #row("state") { status_tag (request.is_new ? "New" : "in progress"), (request.is_new? ? :ok : :error) }
        row("state") { status_tag (request.state=='New'  ? 'New' : request.state),(request.state=='New'  ? :error : :ok) }
        row("type") { request.type }
        row("type_person") { request.type_person }
        row("Legal Law") { request.speciality_area.name }
        row("Monthly Income") { request.monthly_income }
        row("Created at") { request.created_at.strftime("%Y/%m/%d ") }
        #row("Project") { link_to task.project.title, admin_project_path(task.project) }
        #row("Assigned To") { link_to task.admin_user.email, admin_admin_user_path(task.admin_user) }
        #row("Due Date") { task.due_date? ? l(task.due_date, :format => :long) : '-' }
      end
    end
    panel 'Description' do
      div do
        request.description
      end
    end
    panel "Caso derivado A" do
      attributes_table_for request.proposal_requests do
        row  :lawyer
      end
    end
    div link_to 'Derivar Caso', new_admin_proposal_request_path(:id => request)

  end

  sidebar 'Other Request user' do
    "hola mundo"
  end
  #index :as => :grid do |product|
  #  link_to(product.type, admin_product_path(product))
  #end

end
