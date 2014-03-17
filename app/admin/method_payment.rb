ActiveAdmin.register MethodPayment, :namespace => "superadmin" do

  scope :all, :default => true

  menu :label => proc{ I18n.t("method payment") }, :parent => "Configurations"

  controller do
    def resource_params
      return [] if request.get?
      [ params.require(:method_payment).permit(:name) ]
    end
  end
end
