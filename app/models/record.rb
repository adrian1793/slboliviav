class Record < ActiveRecord::Base


  belongs_to :request

  validates :name, :request_id, presence: true

  mount_uploader :record, RecordsUploader

end