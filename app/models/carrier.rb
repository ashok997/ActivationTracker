class Carrier < ApplicationRecord
    has_many :activations
    has_many :phones, through: :activations

end
