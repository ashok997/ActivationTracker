class User < ApplicationRecord
    has_many :activations
    has_secure_password

    validates :name, :username, :email, presence: true
end
