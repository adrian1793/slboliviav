class City < ActiveRecord::Base
  has_many :customers
  belongs_to :state
end
