ActiveAdmin.register ProposalRequest do

  menu false
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :request_id, :lawyer_id
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  form do |f|
    f.inputs 'Proposal request' do

      f.input :request_id, :as => :hidden
      f.input :lawyer#s, :as => :check_boxes, :collection => Lawyer.all

    end
    f.actions
  end

  controller do
    def new
      new! do |format|
        @proposal_request.request_id =  params[:id]
        #@lawyers = ProposalRequest.where()
        format.html
      end
    end
    #def create
      #raise params[:proposal_request][:lawyers].inspect
    #  @proposal_request = ProposalRequest.new(:request_id => params[:proposal_request][:request_id], :lawyers => params[:proposal_request][:lawyers])
      #raise @proposal_request.inspect
    #  create!
    #end
  end

end
