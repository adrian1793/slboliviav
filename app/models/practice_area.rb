class PracticeArea < ActiveRecord::Base
  has_many :speciality_areas

  validates :name, :name_english, :name_portuguese, :presence => true
end
