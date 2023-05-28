class Maker < ApplicationRecord
    has_many :kitchens, dependent: :destroy
end
