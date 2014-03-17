ActiveAdmin.register CaseAbout, :namespace => "superadmin" do

  menu :label => proc{ I18n.t("case about") }, :parent => "Configurations"

  controller do
    def resource_params
      return [] if request.get?
      [ params.require(:case_about).permit(:name) ]
    end
  end
end
