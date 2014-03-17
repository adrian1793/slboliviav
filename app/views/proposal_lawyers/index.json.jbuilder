json.array!(@proposal_lawyers) do |proposal_lawyer|
  json.extract! proposal_lawyer, :presentation, :description, :propose_terms
  json.url proposal_lawyer_url(proposal_lawyer, format: :json)
end
