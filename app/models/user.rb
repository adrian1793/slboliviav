class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :customer
  has_one :lawyer

  accepts_nested_attributes_for :customer , :allow_destroy => true

  #scope :lawyer, -> { joins(:lawyers).where('lawyers.user_id = ?', true) }
  def is_customer?
     if self.customer.nil?
       false
     else
       true
     end
  end
  def name
    self.email
  end
  def type_user
    if self.customer.nil?
      'lawyer'
    else
      'Customer'
    end
  end
end
