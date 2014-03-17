class Customer < ActiveRecord::Base
  validates :first_name, :last_name, :ci, :gender, :date_of_birth, :address, :city_id, presence: true
  validates :phone, :cell_phone, numericality: {greater_than: 0}
  validates :ci, :uniqueness => true


  belongs_to :user
  belongs_to :city

  has_many :requests

  #accepts_nested_attributes_for :user , :allow_destroy => true

  def full_name
    self.last_name+" "+self.first_name
  end

  def country
    city = self.city
    city.name+"-"+ city.state.name+"-"+city.state.country.name
  end
end

