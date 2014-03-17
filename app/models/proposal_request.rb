class ProposalRequest < ActiveRecord::Base

  belongs_to :request
  belongs_to :lawyer

  has_one :proposal_lawyer


  validates  :request_id, :lawyer_id, :presence => true
end
