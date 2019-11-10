class User < ApplicationRecord
    has_many :activations
    has_secure_password

    validates :username, :email, presence: true
    validates :email, :username, uniqueness: true
end
