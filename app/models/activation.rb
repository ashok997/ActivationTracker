class Activation < ApplicationRecord
  belongs_to :user
  belongs_to :carrier
  belongs_to :phone

  def self.by_user(user_id)
    where(user: user_id)
  end
end
