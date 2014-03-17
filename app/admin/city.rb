ActiveAdmin.register City, :namespace => "superadmin" do

  permit_params   :name, :state_id

  menu :label => proc{ I18n.t("cities") }, :parent => "Country"

  index do
    column :state do |membership|
      link_to membership.state.name, superadmin_state_path(membership.state)
    end
    column :name do |city|
      link_to city.name, superadmin_city_path(city)
    end
    default_actions
  end


# Filter only by name
  filter :name



end
