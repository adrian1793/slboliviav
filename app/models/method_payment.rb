class MethodPayment < ActiveRecord::Base
  has_many :requests
end
