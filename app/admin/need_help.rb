ActiveAdmin.register NeedHelp, :namespace => "superadmin" do

  menu :label => proc{ I18n.t("need help") }, :parent => "Configurations"

  controller do
    def resource_params
      return [] if request.get?
      [ params.require(:need_help).permit(:name) ]
    end
  end
end
