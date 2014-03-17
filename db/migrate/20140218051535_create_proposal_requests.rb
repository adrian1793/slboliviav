class CreateProposalRequests < ActiveRecord::Migration
  def change
    create_table :proposal_requests do |t|
      t.integer :request_id
      t.integer :lawyer_id

      t.timestamps
    end
  end
end
