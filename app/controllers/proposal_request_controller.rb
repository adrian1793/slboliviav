class ProposalRequestController < ApplicationController

  before_filter :authenticate_user!

  def index

  end

  def index_lawyer
    @proposal_request = ProposalRequest.where(:lawyer_id => current_user.lawyer.id)
  end

  def show
  end

  def show_lawyer

    @proposal_request = ProposalRequest.find(params[:id])
    @request = @proposal_request.request

  end
end
