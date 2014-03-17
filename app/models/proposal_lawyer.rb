class ProposalLawyer < ActiveRecord::Base

  belongs_to :proposal_request
  belongs_to :lawyer

  validates :propose_terms, :description, :presentation, :proposal_request_id, :presence => true

end