class Comment < ApplicationRecord
  belongs_to :customer
  belongs_to :post

  validates :reaction, presence: true
end
