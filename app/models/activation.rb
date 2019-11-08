class Activation < ApplicationRecord
  belongs_to :user
  belongs_to :carrier
  belongs_to :phone

  validates :phone_number, :IMEI, presence: true
  validates :IMEI, :phone_number, uniqueness: true

  def self.by_user(user_id)
    where(user: user_id)
  end
end
