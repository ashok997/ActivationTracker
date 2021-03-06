class Activation < ApplicationRecord
  belongs_to :user
  belongs_to :carrier
  belongs_to :phone

  validates :phone_number, :IMEI, presence: true
  validates :IMEI, :phone_number, uniqueness: true
  validates :phone_number, length: {is: 10}
  validates :IMEI, length: {is: 15}


  def self.by_user(user_id)
    where(user: user_id)
  end

  def self.with_carrier(carrier_id)
    where(carrier: carrier_id)
  end

end
