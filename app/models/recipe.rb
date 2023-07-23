class Recipe < ApplicationRecord
  
  belongs_to :user
  belongs_to :genre
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  has_one_attached :image
  
  # get_imageメソッドを定義
  def get_image(width,height)
    # 画像が添付されていない場合
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    # 画像が添付されている場合
    image.variant(resize_to_limit: [width,height]).processed
  end
  
  # 保存機能を定義
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
end
