class Request < ActiveRecord::Base
  belongs_to :method_payment
  belongs_to :speciality_area

  belongs_to :customer

  has_many :records
  has_many :proposal_requests

  accepts_nested_attributes_for :records, :allow_destroy =>  true

  validates  :type_person, :type, :speciality_area_id, :case_about, :monthly_income, :state, :presence => true

  #validates_associated :method_payment, :speciality_area

  #scope :all, :default => true
  scope :new_request, where(:state => 'new')
  scope :process_request, where(:state => 'process')
  scope :established_request, where(:state => 'established')


  self.inheritance_column = nil


  def title
    self.speciality_area.name+' -  '+ self.customer.full_name
  end
end
