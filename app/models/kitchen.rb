class Kitchen < ApplicationRecord
    has_one_attached :image
  belongs_to :genre
  belongs_to :maker

  has_many :evaluation, dependent: :destroy
  has_many :posts, dependent: :destroy

  def with_tax_price
    (price * 1.1).floor
    # ceilは切り上げ、floorが切り捨て、roundが四捨五入
  end

  def self.search(keyword)
    where(["name like? OR introduction like?", "%#{keyword}%", "%#{keyword}%"])
  end

  def get_image(width,height)
    unless image.attached?
      file_path = Rails.root.join("app/assets/images/no_image.jpg")
      image.attach(io: File.open(file_path),filename: "default-image.jpeg", content_type: "image/jpeg")
    end
    image.variant(resize_to_limit: [width,height]).processed
  end
end
