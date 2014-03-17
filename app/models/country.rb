class Country < ActiveRecord::Base

  has_many :states, dependent: :destroy

  accepts_nested_attributes_for :states, :allow_destroy => true, :update_only => true

end
