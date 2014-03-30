ActiveAdmin.register State, :namespace => "superadmin" do
  #belongs_to :country

  permit_params :country_id,  :name, cities_attributes:[:name, :state_id ]

  menu :label => proc{ I18n.t("states") }, :parent => "Country"



  index do
    column :country do |membership|
      membership.country.name
    end
    column :name
    default_actions
  end

# Filter only by name
  filter :name

  form do |f|
    f.inputs "State" do
      f.input :country
      f.input :name
    end

    f.has_many :cities, :allow_destroy => true, :heading => 'CITIES' do |cf|
      cf.input :name
    end

    f.actions
  end

  show :name => :name do
    panel "Cities" do
      table_for state.cities do |c|
        #s.column("name") { |task| status_tag (task.name ? "Beni" : "La Paz"), (task.name ? :ok : :error) }
        c.column("name") { |city| link_to city.name, superadmin_city_path(city) }
        #s.column("Assigned To") { |task| task.admin_user.email }
        #s.column("Due Date") { |task| task.due_date? ? l(task.due_date, :format => :long) : '-' }
      end
    end
  end
end