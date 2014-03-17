class Lawyer < ActiveRecord::Base

  belongs_to :user
  has_many :proposal_requests

  validates :name, :address, :city, :phone, :cell_phone, presence: true

end
