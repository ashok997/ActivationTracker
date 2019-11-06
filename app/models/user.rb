class User < ApplicationRecord
    has_many :activations
    has_secure_password
end
