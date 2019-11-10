class Phone < ApplicationRecord
    has_many :activations
    has_many :carriers, through: :activations

    validates :manufacturer, :model,  :storage, presence: true
   
end
