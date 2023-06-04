class Post < ApplicationRecord
  # customerのアソシエーション
  belongs_to :customer
  belongs_to :kitchen

  # 投稿のコメントへのアソシエーション
  has_many :comments, dependent: :destroy
  has_many :evaluation, dependent: :destroy

  has_one_attached :image

  validates :star, presence: true
  validates :image, presence: true
  validates :review, presence: true

  def profile_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
end
