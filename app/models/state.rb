class State < ActiveRecord::Base

  belongs_to :country
  has_many :cities, dependent:  :destroy

  accepts_nested_attributes_for :cities, allow_destroy: true

end
