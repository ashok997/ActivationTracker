class Activation < ApplicationRecord
  belongs_to :user
  belongs_to :carrier
  belongs_to :phone
end
