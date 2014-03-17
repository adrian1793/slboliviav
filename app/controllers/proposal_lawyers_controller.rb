class ProposalLawyersController < InheritedResources::Base

  before_filter :authenticate_user!


  def new
    proposal_request = ProposalRequest.find(params[:id])
    @proposal_lawyer = ProposalLawyer.new(proposal_request_id: proposal_request.id)

    new!

  end

  def show_customer
    @proposal_lawyer = ProposalLawyer.find(params[:id])

  end

  def permitted_params
    params.permit(:proposal_lawyer => [:proposal_request_id, :presentation, :description, :propose_terms])
  end
end
