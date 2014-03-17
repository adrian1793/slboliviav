class SpecialityArea < ActiveRecord::Base
  has_many :requests
  belongs_to :practice_area

  validates :practice_area_id, :presence => true

  def full_name
    self.practice_area.name+' - '+self.name
  end
end
