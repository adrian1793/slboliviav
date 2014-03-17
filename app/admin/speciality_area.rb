ActiveAdmin.register SpecialityArea, :namespace => "superadmin" do

  permit_params :name, :name_english, :name_portuguese, :practice_area_id

  menu :label => proc{ I18n.t("speciality area") }, :parent => "Configurations"

end
