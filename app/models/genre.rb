class Genre < ApplicationRecord
  has_many :kitchens, dependent: :destroy
end
