class Phone < ApplicationRecord
    has_many carriers, through :activation
end
