ActiveAdmin.register Country, :namespace => "superadmin" do

  permit_params :name#, states_attributes:[:name, :country_id]

  menu :label => proc{ I18n.t("countries") }, :parent => "Country"

  index do
    column :name do |country|
      link_to country.name, superadmin_country_path(country)
    end
    default_actions
  end

# Filter only by name
  filter :name

  form do |f|
    f.inputs "Country" do
      f.input :name
    end

    f.inputs do
      f.has_many :states, :allow_destroy => true, :heading => 'STATES' do |cf|
        cf.inputs :country_id, :as => :hidden
        cf.input :name
      end
    end
    f.actions
  end

  show :name => :name do
    panel "States" do
      table_for country.states do |s|
        #s.column("name") { |task| status_tag (task.name ? "Beni" : "La Paz"), (task.name ? :ok : :error) }

        s.column("name") { |state| link_to state.name, superadmin_state_path(state) }

        #s.column("Assigned To") { |task| task.admin_user.email }
        #s.column("Due Date") { |task| task.due_date? ? l(task.due_date, :format => :long) : '-' }
      end
    end
  end

end