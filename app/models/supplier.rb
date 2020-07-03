class Supplier < ApplicationRecord
    has_many :products
    has_many :ware_houses
end
